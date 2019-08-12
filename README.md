# FTinker

基于flutter兼容web、android、ios的开发框架

## 框架

FTinker包含了以下框架

- [redux](https://github.com/johnpryan/redux.dart)
- [redux_thunk](https://github.com/brianegan/redux_thunk)
- [rxdart](https://github.com/ReactiveX/rxdart)
- [http](https://github.com/dart-lang/http)

## 目录结构

- lib/common/tinker_framework 框架相关内容，需要引入该文件
- lib/common/global.dart 用于存储项目全局变量
- lib/common/tinker/ 框架的具体实现
- lib/page/ 项目的具体页面
- lib/redux/ 用于生成action，修改store值，并通知ui更新



## 开源协议

[MIT](https://github.com/TinkerXXX/FTinker/LICENSE)
