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

    // TODO: Verify the logic of the optimal BaseTime based on the current time

    // const minute: number = date.getMinutes();

    // if (minute < 30) {
    //   ultraShortTermForecastBaseTime = `${(hour - 1)}30`;
    // } else {
    //   ultraShortTermForecastBaseTime = `${hour}30`;
    // }

    // INFO: The data is not ready on the KMA server at 30 minutes of the current time, so the BaseTime is returned based on 2 hours before the current time
    let calculatedHour: number;

    if (hour < 2) {
      calculatedHour = hour + 22; // INFO: To calculate 22:00, 23:00 for 0:00, 1:00
    } else {
      calculatedHour = hour - 2;
    }

    return `${calculatedHour.toString().padStart(2, '0')}00`;
  }

