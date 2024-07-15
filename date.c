#include "types.h"
#include "user.h"
#include "date.h"
//date.h
// struct rtcdate {
//   uint second;
//   uint minute;
//   uint hour;
//   uint day;
//   uint month;
//   uint year;
// };
int main(int argc, char *argv[]) {
    struct rtcdate* time = (struct rtcdate*)malloc(sizeof(struct rtcdate));
    if(date(time) == 0){
    printf(1, "%d-%02d-%02dT%02d:%02d:%02d\n", time->year, time->month,
            time->day, time->hour, time->minute, time->second);
    }
    free(time);
    exit();
}
