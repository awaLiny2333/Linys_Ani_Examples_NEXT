import ResponsiveLayout from '../components/ResponsiveLayout';
import any_item from './FadeInExample';

@Entry
@Component
struct responsiveLayoutExample {
  @State labels: string[] = ["Meow", "¯\\_(ツ)_/¯", "( •̀ ω •́ )✧", "在一起 Together", "(～o￣3￣)～", "就可以！TECH4ALL"]

  build() {
    Column() {
      ResponsiveLayout({
        title: $r('app.string.index_example_responsiveLayout'),
        subTitle: 'ヽ(￣ω￣(￣ω￣〃)ゝ',
      }) {
        ForEach(this.labels, (text: string, index: number) => {
          any_item({ text: text, timeout: index })
        })
      }
    }
    .height("100%")
    .width("100%")
  }
}