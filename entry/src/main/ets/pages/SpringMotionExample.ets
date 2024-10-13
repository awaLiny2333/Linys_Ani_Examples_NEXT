import Curves from '@ohos.curves';
import { click_effect_default, fontSize_Large } from '../defaults/defaults';
import { fontSize_Extra_Large } from '../defaults/defaults';

@Entry
@Component
struct SpringMotionExample {
  @State message: string = '(๑´ﻌ｀๑)';
  align_left: AlignRuleOption = {
    center: { anchor: '__container__', align: VerticalAlign.Center },
    left: { anchor: '__container__', align: HorizontalAlign.Start }
  };
  align_right: AlignRuleOption = {
    center: { anchor: '__container__', align: VerticalAlign.Center },
    right: { anchor: '__container__', align: HorizontalAlign.End }
  };
  @State align_rules: AlignRuleOption = this.align_left;
  @State went_to_the_right: boolean = false;
  @State response: number = 0.55;
  @State response_edit: number = 0.55;
  @State dampingFraction: number = 0.825;
  @State dampingFraction_edit: number = 0.825;

  build() {
    Column() {
      Row({ space: 15 }) {
        Navigator({ target: 'pages/Index', type: NavigationType.Back }) {
          Text('󰃚')
            .fontWeight(FontWeight.Bold)
            .fontSize(fontSize_Extra_Large())
            .clickEffect(click_effect_default())
        }

        Text('弹性动画')
          .fontWeight(FontWeight.Bold)
          .fontSize(fontSize_Large())
      }
      .alignItems(VerticalAlign.Center)


      RelativeContainer() {
        Text(this.message)
          .fontSize(fontSize_Extra_Large())
          .fontWeight(FontWeight.Bold)
          .alignRules(this.align_rules)
          .animation({ curve: Curves.springMotion(this.response, this.dampingFraction) })
        // .animation({ duration: 1000, delay: 1000, curve: Curve.ExtremeDeceleration })
      }
      .layoutWeight(1)

      Column({ space: 10 }) {

        Row({ space: 10 }) {
          Text("response")
            .fontWeight(FontWeight.Bold)
          TextInput({ text: this.response.toString() })
            .selectAll(true)
            .onChange((a) => {
              let new_value = Number.parseFloat(a);
              this.response_edit = new_value
            })
            .onSubmit(() => {
              this.response = this.response_edit;
            })
            .layoutWeight(1)
        } // Response input

        Text("当 dampingFraction = 0 时动画的时长")
        Text("也等于 dampingFraction = 0 时弹一个来回的时长")
          .margin({ bottom: 10 })

        Row({ space: 10 }) {
          Text("dampingFraction")
            .fontWeight(FontWeight.Bold)
          TextInput({ text: this.dampingFraction.toString() })
            .selectAll(true)
            .onChange((a) => {
              let new_value = Number.parseFloat(a);
              this.dampingFraction_edit = new_value;
            })
            .onSubmit(() => {
              this.dampingFraction = this.dampingFraction_edit;
            })
            .layoutWeight(1)
        } // DampingFraction input

        Text("[0，1) 值越小越弹，0 时一直弹")
        Text("1 临界，也就是普通的渐缓")
        Text("(1, ＋∞) 值越大渐缓越明显")
          .margin({ bottom: 10 })

        Column() {
          Text(".animation({ curve: Curves.springMotion(" + this.response.toString() + ", " +
          this.dampingFraction.toString() + ") })")
            .fontColor($r('app.color.start_window_background'))
            .fontWeight(FontWeight.Medium)
        }
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Center)
        .padding(16)
        .borderRadius(22)
        .backgroundColor($r('app.color.color_accent'))
        .width("100%")
        .clickEffect(click_effect_default())
        .animation({ curve: Curves.springMotion(this.response, this.dampingFraction) })

        Button("ε=( o｀ω′)ノ")
          .fontColor($r('app.color.start_window_background'))
          .type(ButtonType.Capsule)
          .width("100%")
          .onClick(() => {
            if (this.went_to_the_right) {
              this.align_rules = this.align_left;
            } else {
              this.align_rules = this.align_right;
            }
            this.went_to_the_right = !this.went_to_the_right;
          })
          .clickEffect(click_effect_default())
          .fontWeight(FontWeight.Bold)
          .backgroundColor($r('app.color.color_accent'))
          .animation({ curve: Curves.springMotion(this.response, this.dampingFraction) })

      }
      .alignItems(HorizontalAlign.Start)
      .width("100%")
    }
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 20, right: 20, top: 10 })
  }
}