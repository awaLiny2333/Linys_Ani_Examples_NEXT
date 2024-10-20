import Curves from '@ohos.curves';
import woofSymbolDetails from '../components/woofSymbolDetails';
import {
    click_effect_default,
    fontSize_Extra_Large,
    fontSize_Icon_Button,
    fontSize_Large
} from '../defaults/defaults';
import { symbolsNames } from '../defaults/sysSymbols';

@Entry
@Component
struct SymbolsExample {
  @State allSymbols: string[] = symbolsNames;
  @State animationParam: AnimateParam = { curve: Curves.springMotion(0.3, 1) };
  @State requestSymbolName: string = "";
  @State area_width: number = 300;

  build() {
    Column({ space: 15 }) {
      Row({ space: 15 }) {
        Navigator({ target: 'pages/Index', type: NavigationType.Back }) {
          Text('󰃚')
            .fontWeight(FontWeight.Bold)
            .fontSize(fontSize_Extra_Large())
            .clickEffect(click_effect_default())
        }

        Text($r('app.string.index_example_symbols'))
          .fontWeight(FontWeight.Bold)
          .fontSize(fontSize_Large())
      }
      .alignItems(VerticalAlign.Center)


      WaterFlow() {
        ForEach(this.allSymbols, (item: string, _index: number) => {
          FlowItem() {
            Column() {
              SymbolGlyph($r("sys.symbol.".concat(item)))
                .fontSize(48)
                .fontColor([$r('app.color.color_accent')])
            }
            .alignItems(HorizontalAlign.Center)
            .width("100%")
            .padding(10)
            .onClick(() => {
              let woof_control: CustomDialogController = new CustomDialogController({
                builder: woofSymbolDetails({
                  glyphName: item,
                  glyphID: symbolsNames.indexOf(item)
                }),
                alignment: DialogAlignment.Center,
                // cornerRadius: 12
              })
              woof_control.open()
            })
          }
          .width("100%")
          .animation(this.animationParam)
        })
      }
      .onAreaChange((_old, n) => {
        this.area_width = n.width as number;
      })
      .columnsTemplate("1fr ".repeat(Math.ceil(this.area_width / 70)))
      .layoutWeight(1)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)

      Row({ space: 10 }) {
        TextInput({ text: this.requestSymbolName })
          .onChange((a) => {
            this.requestSymbolName = a;
          })
          .onSubmit(() => {
            this.refresh_visibility_statuses();
          })
          .layoutWeight(1)
        SymbolGlyph($r('sys.symbol.magnifyingglass'))
          .fontSize(fontSize_Icon_Button())
          .fontWeight(FontWeight.Bold)
          .fontColor([$r('app.color.color_accent')])
          .onClick(() => {
            this.refresh_visibility_statuses();
          })
      }

    }
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 20, right: 20, top: 10 })
  }

  fill_zeros_to_string(num: number, length: number) {
    return String("0".repeat(Math.max(length - num.toString().length, 0)) + num.toString());
  }

  refresh_visibility_statuses() {
    if (this.requestSymbolName == "") {
      this.allSymbols = symbolsNames;
      return;
    }
    this.allSymbols = [];
    for (let index = 0; index < symbolsNames.length; index++) {
      if (symbolsNames[index].includes(this.requestSymbolName)) {
        this.allSymbols.push(symbolsNames[index])
      }
    }
  }
}