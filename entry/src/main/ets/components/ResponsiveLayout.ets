import Curves from '@ohos.curves';
import { fontSize_Extra_Large, fontSize_Large } from '../defaults/defaults';

@Entry
@Component
struct ResponsiveLayout {
  // Basic info
  @State title: ResourceStr = ""
  @State subTitle: ResourceStr = ""
  @State alignRules_left: AlignRuleOption = {
    center: { anchor: "__container__", align: VerticalAlign.Center },
    left: { anchor: "__container__", align: HorizontalAlign.Start }
  }
  @State alignRules_right: AlignRuleOption = {
    center: { anchor: "__container__", align: VerticalAlign.Center },
    right: { anchor: "__container__", align: HorizontalAlign.End }
  }
  @State alignRules_top: AlignRuleOption = {
    top: { anchor: "__container__", align: VerticalAlign.Top },
    middle: { anchor: "__container__", align: HorizontalAlign.Center }
  }
  @State alignRules_bottom: AlignRuleOption = {
    bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
    middle: { anchor: "__container__", align: HorizontalAlign.Center }
  }
  @State alignLeftProportion: number = 0.3;
  @State alignTopProportion: number = 0.5;
  @State animationParam: AnimateParam = { curve: Curves.springMotion(0.3, 1) };
  // Statuses
  @State landscapeLayout: boolean = false;
  @State areaWidth: number = 0;
  @State areaHeight: number = 0;
  @State content_height: number = 0;
  // Pass in content components
  @BuilderParam content_section: () => void;

  build() {
    Scroll() {
      RelativeContainer() {
        Column() {
          Text(this.title)
            .fontWeight(FontWeight.Bold)
            .fontSize(fontSize_Extra_Large())
          Text(this.subTitle)
            .fontWeight(FontWeight.Bold)
            .fontSize(fontSize_Large())
            .opacity(0.5)

        } // title section
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Start)
        .padding(10)
        .borderRadius(16)
        // Position settings
        .alignRules(this.landscapeLayout ? this.alignRules_left : this.alignRules_top)
        .width((this.landscapeLayout ? this.alignLeftProportion : 1) * this.areaWidth - (this.landscapeLayout ? 20 : 0))
        .height((this.landscapeLayout ? 1 : this.alignTopProportion) * this.areaHeight)
        .animation(this.animationParam)

        Scroll() {
          Column({ space: 10 }) {
            this.content_section();
          } // content section
          .width("100%")
          .onAreaChange((_o, n) => {
            // Update content height
            this.content_height = n.height as number + 30;
          })
          .animation(this.animationParam)
        } // title section
        .edgeEffect(EdgeEffect.Spring)
        .padding(10)
        .borderRadius(16)
        .scrollBar(this.landscapeLayout ? BarState.Auto : BarState.Off)
        .enableScrollInteraction(this.landscapeLayout ? true : false)
        // Position settings
        .alignRules(this.landscapeLayout ? this.alignRules_right : this.alignRules_bottom)
        .width((this.landscapeLayout ? 1 - this.alignLeftProportion : 1) * this.areaWidth)
        .height((this.landscapeLayout ? this.areaHeight : this.content_height))
        .animation(this.animationParam)

      } // base container of sub sections
      .width("100%")
      .height(this.landscapeLayout ? "100%" : (this.alignTopProportion * this.areaHeight + this.content_height))
      .animation(this.animationParam)

    } // The base of everything
    .edgeEffect(EdgeEffect.Spring)
    .padding({ left: this.landscapeLayout ? 30 : 10, right: 10, top: 10 })
    .scrollBar(this.landscapeLayout ? BarState.Off : BarState.Auto)
    .enableScrollInteraction(this.landscapeLayout ? false : true)
    .onAreaChange((_o, n) => {
      // Set display size
      this.areaWidth = n.width as number - 20;
      this.areaHeight = n.height as number - 20;
      // determine tabletMode
      if (this.areaWidth > 400) {
        this.landscapeLayout = true;
      } else {
        this.landscapeLayout = false;
      }
    })
    .width("100%")
    .height("100%")
    .animation(this.animationParam)
  }

  proportion_float_to_string(p: number) {
    return (p * 100).toString() + "%";
  }
}

export default ResponsiveLayout;