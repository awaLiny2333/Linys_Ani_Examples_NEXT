import Curves from '@ohos.curves';
import { fontSize_Extra_Large, fontSize_Large } from '../defaults/defaults';

@Entry
@Component
struct FadeInExample {
  @State response: number = 0.55;
  @State dampingFraction: number = 0.825;
  @State labels: string[] = ["Meow", "¯\\_(ツ)_/¯", "( •̀ ω •́ )✧", "在一起", "(～o￣3￣)～", "就可以！"]

  build() {

    Column({ space: 10 }) {
      Row({ space: 15 }) {
        Navigator({ target: 'pages/Index', type: NavigationType.Back }) {
          Text('󰃚')
            .fontWeight(FontWeight.Bold)
            .fontSize(fontSize_Extra_Large())
            .clickEffect({ level: ClickEffectLevel.LIGHT })
        }

        Text('浮现入场')
          .fontWeight(FontWeight.Bold)
          .fontSize(fontSize_Large())
      }
      .alignItems(VerticalAlign.Center)

      Scroll() {
        Column({ space: 10 }) {
          ForEach(this.labels, (text: string, index: number) => {
            item({ text: text, timeout: index })
          })
        }
      }.edgeEffect(EdgeEffect.Spring)

    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 20, right: 20, top: 10 })
  }
}

export default FadeInExample

@Component
struct item {
  @State text: string = "";
  @State offset_y: number = 100;
  @State opa: number = 0;
  @State timeout: number = 0;

  build() {
    Column() {
      Text(this.text)
        .fontColor($r('app.color.start_window_background'))
        .fontWeight(FontWeight.Bold)
        .fontSize(fontSize_Large())

      Text(this.timeout.toString())
        .fontWeight(FontWeight.Bold)
        .fontSize(fontSize_Extra_Large())
        .fontColor($r('app.color.start_window_background'))
        .opacity(0.4)
        .textAlign(TextAlign.End)
        .width("100%")
    }
    // Basics
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
    .backgroundColor($r('app.color.color_accent'))
    .width("100%")
    .borderRadius(22)
    .padding(16)
    // Entry animation
    .offset({ y: this.offset_y })
    .opacity(this.opa)
    .animation({ curve: Curves.springMotion(0.5, 0.7) })
    .onAppear(() => {
      setTimeout(() => {
        this.opa = 1;
        this.offset_y = 0;
      }, (this.timeout) * 100)
    })
  }
}