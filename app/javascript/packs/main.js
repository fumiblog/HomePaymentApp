import { CountUp } from '/app/javascript/lib/countup/countUp.js'; //ライブラリのjsファイル
const options = {
  startVal: 0, //開始の数　（デフォルト 0）
  duration: 3, //3秒で到達　（デフォルト 2）
  separator: '', //カンマを入れない　（デフォルト カンマあり）
};

let demo = new CountUp('progressCoin', 10000, options);
if (!demo.error) {
  demo.start();
} else {
  console.error(demo.error);
}
