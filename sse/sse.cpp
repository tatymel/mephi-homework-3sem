#include "sse.h"
#include <immintrin.h>
#include <avxintrin.h>

struct OptimizedModel {
    std::vector<int> index;
    std::vector<float> thresholds;
    std::vector<float> values;
};

std::shared_ptr<OptimizedModel> Optimize(const Model& model) {
    std::shared_ptr<OptimizedModel> optimizedModel = std::make_shared<OptimizedModel>();

    size_t sz = model.size();
    optimizedModel->index.reserve(sz);
    optimizedModel->thresholds.reserve(sz);
    optimizedModel->values.reserve(sz);

    for (const auto& rule : model) {
        optimizedModel->index.push_back(rule.index);
        optimizedModel->thresholds.push_back(static_cast<float>(rule.threshold));
        optimizedModel->values.push_back(static_cast<float>(rule.value));
    }

    return optimizedModel;
}

double ApplyOptimizedModel(const OptimizedModel& model, const std::vector<float>& features) {
    double answer = 0.0;
    size_t sz = model.index.size();

    __m256 summa = _mm256_setzero_ps();
    size_t i =0;
    
    for (; i + 7 < sz; i += 8) {
        //load values
        __m256 thresholdsVec = _mm256_loadu_ps(&model.thresholds[i]);
        __m256 valuesVec = _mm256_loadu_ps(&model.values[i]);
        __m256 featuresVec = _mm256_set_ps(
            features[model.index[i + 7]], features[model.index[i + 6]], features[model.index[i + 5]],
            features[model.index[i + 4]], features[model.index[i + 3]], features[model.index[i + 2]],
            features[model.index[i + 1]], features[model.index[i]]
        );
          
        //compare and take appropriate
        __m256 mask = _mm256_cmp_ps(featuresVec, thresholdsVec, _CMP_GT_OQ);
        __m256 appropriate_values = _mm256_and_ps(mask, valuesVec);

        //to sum
        summa = _mm256_add_ps(summa, appropriate_values);  
    }

    //to our answer
    __m128 second = _mm256_castps256_ps128(summa);
    __m128 first = _mm256_extractf128_ps(summa, 1);
    __m128 summaAll = _mm_add_ps(second, first);
    summaAll = _mm_hadd_ps(summaAll, summaAll);
    summaAll = _mm_hadd_ps(summaAll, summaAll);
    answer += _mm_cvtss_f32(summaAll);

    for (; i < sz; ++i) {
        if (features[model.index[i]] > model.thresholds[i]) {
            answer += model.values[i];
        }
    }

    return answer;
}