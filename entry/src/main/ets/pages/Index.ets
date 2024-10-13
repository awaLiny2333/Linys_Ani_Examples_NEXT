import ButtonCard from '../components/ButtonCard'
import { fontSize_Extra_Large, fontSize_Large } from '../defaults/defaults'

@Entry
@Component
struct Index {
  build() {
    Scroll() {
      Column({ space: 10 }) {

        Row()
          .height(30)
        Text('Liny 的\n动画游乐场')
          .fontWeight(FontWeight.Bold)
          .fontSize(fontSize_Extra_Large())
        Text('ヾ(⌐■_■)ノ♪')
          .fontWeight(FontWeight.Bold)
          .fontSize(fontSize_Large())
          .opacity(0.5)
        Row()
          .height(30)

        ButtonCard({
          navigate_target: 'pages/SpringMotionExample',
          title: 'Curves.springMotion 弹性动画案例',
          subtitle: '2024 / 10 / 10',
          corner: '01',
          card_height: 140,
          timeout: 0
        })

        ButtonCard({
          navigate_target: 'pages/FadeInExample',
          title: '浮现入场动画案例',
          subtitle: '2024 / 10 / 13',
          corner: '02',
          card_height: 140,
          timeout: 1
        })

      }
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 20, right: 20 })
    }
    .height("100%")
    .edgeEffect(EdgeEffect.Spring)
    .align(Alignment.Top)
  }
}