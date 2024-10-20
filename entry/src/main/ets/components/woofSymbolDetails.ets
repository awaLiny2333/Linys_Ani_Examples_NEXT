import { fontSize_Large, fontSize_Normal } from '../defaults/defaults';

@CustomDialog
struct woofSymbolDetails {
  controller: CustomDialogController;
  @Prop glyphID: number = 0;
  @Prop glyphName: string = '';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        SymbolGlyph($r('sys.symbol.'.concat(this.glyphName)))
          .fontSize(128)
          .fontColor([$r('app.color.color_accent')])
          .padding({ bottom: 20 })

        Text("sys.symbol." + this.glyphName)
          .fontColor($r('app.color.color_accent'))
          .fontWeight(FontWeight.Medium)
          .fontSize(fontSize_Normal())
        Text((this.glyphID + 125830644).toString() + " (" + this.fill_zeros_to_string(this.glyphID, 4) + ")")
          .fontColor($r('app.color.color_accent'))
          .fontSize(fontSize_Normal())
          .opacity(0.7)
      }
      .padding(40)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width("100%")
    }
    .backgroundColor($r('app.color.start_window_background'))
    .edgeEffect(EdgeEffect.Spring)
  }

  fill_zeros_to_string(num: number, length: number) {
    return String("0".repeat(Math.max(length - num.toString().length, 0)) + num.toString());
  }
}

export default woofSymbolDetails;