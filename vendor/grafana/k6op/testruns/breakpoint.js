import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for breakpoint in this section
  executor: 'ramping-arrival-rate', //Assure load increase if the system slows
  stages: [
    { duration: '6m', target: 20000 }, // just slowly ramp-up to a HUGE load
  ],
};

export default () => {
  const urlRes = http.get('http://whoami.vikingtoe.dev/data?size=500&unit=kb');
  sleep(0.20);
  // MORE STEPS
  // Here you can have more steps or complex script
  // Step1
  // Step2
  // etc.
};

