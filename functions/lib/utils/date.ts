export function getYYYYMMDD(date: Date): string {
    const year = date.getFullYear().toString();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    let day = date.getDate();
    
    const hour = date.getHours();
    
    if (hour < 2) {
      day = day - 1; // INFO: To calculate 22:00, 23:00 for 0:00, 1:00
    }
    
    const parsedDay = day.toString().padStart(2, '0');
    
    return `${year}${month}${parsedDay}`;
}  

export function getUltraShortTermForecastBaseTime(date: Date): string {
  const hour: number = date.getHours();

  // INFO: 현재 시간 30분에 기상청 서버에서 데이터가 준비되지 않아 현재시간 2시간 전 기준으로 BaseTime 반환
  let calculatedHour: number;

  if (hour < 2) {
    calculatedHour = hour + 22; // INFO: 0시, 1시의 2시간 전인 22시,23시를 계산하기 위함
  } else {
    calculatedHour = hour - 2;
  }

  return `${calculatedHour.toString().padStart(2, '0')}00`;
}

export function getShortTermForecastBaseTime(date: Date): string {
  const shortTermForecastBaseTimeList: number[] = [2, 5, 8, 11, 14, 17, 20, 23];

  const hour: number = date.getHours();
  const minute: number = date.getMinutes();

  const filteredBaseTimeList: number[] = [];

  for (const baseTime of shortTermForecastBaseTimeList) {
      if (baseTime <= hour) {
          filteredBaseTimeList.push(baseTime);
      }
  }

  let shortTermForecastBaseTime: number;

  if (filteredBaseTimeList.length === 0) {
      shortTermForecastBaseTime = 23;
  } else {
      shortTermForecastBaseTime = filteredBaseTimeList[filteredBaseTimeList.length - 1];
      const isNotReadyForForcastServer: boolean = shortTermForecastBaseTime === hour && minute < 10;

      if (isNotReadyForForcastServer) {
          if (shortTermForecastBaseTime === 2) {
              shortTermForecastBaseTime = 23;
          } else {
              shortTermForecastBaseTime = filteredBaseTimeList[filteredBaseTimeList.length - 2];
          }
      }
  }

  return `${shortTermForecastBaseTime.toString().padStart(2, '0')}00`;
}


