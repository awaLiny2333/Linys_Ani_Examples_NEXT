import ButtonCard from '../components/ButtonCard'
import ResponsiveLayout from '../components/ResponsiveLayout'

@Entry
@Component
struct Index {
  build() {
    Column(){
      ResponsiveLayout({
        title: $r('app.string.index_title'),
        subTitle: 'ヾ(⌐■_■)ノ♪'
      }){
        ButtonCard({
          navigate_target: 'pages/SpringMotionExample',
          title: $r('app.string.index_example_springMotion'),
          subtitle: '2024 / 10 / 10',
          corner: '01',
          card_height: 140,
          timeout: 0
        })
        ButtonCard({
          navigate_target: 'pages/FadeInExample',
          title: $r('app.string.index_example_floatEntry'),
          subtitle: '2024 / 10 / 13',
          corner: '02',
          card_height: 140,
          timeout: 1
        })
        ButtonCard({
          navigate_target: 'pages/responsiveLayoutExample',
          title: $r('app.string.index_example_responsiveLayout'),
          subtitle: '2024 / 10 / 15',
          corner: '03',
          card_height: 140,
          timeout: 2
        })
        ButtonCard({
          navigate_target: 'pages/SymbolsExample',
          title: $r('app.string.index_example_symbols'),
          subtitle: '2024 / 10 / 20',
          corner: '04',
          card_height: 140,
          timeout: 3
        })
      }
    }
  }
}