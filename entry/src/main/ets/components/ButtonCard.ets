import Curves from '@ohos.curves';
import { LengthMetrics } from '@kit.ArkUI';
import { fontSize_Extra_Large, fontSize_Large } from '../defaults/defaults';

@Component
struct ButtonCard {
  @State navigate_target: string = 'pages/SpringMotionExample'
  @State title: string = 'meow';
  @State subtitle: string = 'meow';
  @State corner: string = '01';
  @State card_height: number = 300;
  @State offset_y: number = 100;
  @State opa: number = 0;
  @State timeout: number = 1;

  build() {
    Navigator({ target: this.navigate_target, type: NavigationType.Push }) {
      RelativeContainer() {

        Text(this.title)
          .fontColor($r('app.color.start_window_background'))
          .lineSpacing(LengthMetrics.vp(5))
          .fontSize(fontSize_Large())
          .fontWeight(FontWeight.Bold)
          .width("100%")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top }
          })
          .padding(16)

        Text(this.subtitle)
          .fontColor($r('app.color.start_window_background'))
          .fontWeight(FontWeight.Medium)
          .fontSize(fontSize_Large())
          .opacity(0.8)
          .width("100%")
          .alignRules({
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          })
          .padding(16)

        Text(this.corner)
          .alignRules({
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          })
          .fontWeight(FontWeight.Bold)
          .padding(16)
          .fontSize(fontSize_Extra_Large())
          .fontColor($r('app.color.start_window_background'))
          .opacity(0.4)
      }
      .borderRadius(20)
      .backgroundColor($r('app.color.color_accent'))
      .width("100%")
      .clickEffect({ level: ClickEffectLevel.LIGHT })
      .height(this.card_height)
    }
    .offset({ y: this.offset_y })
    .opacity(this.opa)
    .animation({ curve: Curves.springMotion(0.5, 0.7) })
    .onAppear(() => {
      setTimeout(() => {
        this.opa = 1;
        this.offset_y = 0;
      }, (this.timeout) * 75)
    })
  }
}

export default ButtonCard