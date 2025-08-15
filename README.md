# AsciiDoc Presentation Generator

AsciiDocから美しいプレゼンテーションスライドとPDF配布資料を生成するシステムです。

## 特徴

- 📊 **インタラクティブスライド** - Reveal.jsによるモダンなプレゼンテーション
- 📄 **PDF配布資料** - 日本語フォント対応、A4横向きレイアウト
- 🎨 **豊富な図表** - Mermaid、PlantUML、Ditaaダイアグラム
- 🌐 **マルチフォーマット** - スライド、PDF、HTMLを一括生成
- 🎯 **章ごと改ページ** - 読みやすい資料構成

## クイックスタート

```bash
# 全ファイル生成
./build.sh

# スライドのみ
npm run build:slides

# PDFのみ
npm run build:pdf
```

## セットアップ

### 必要な環境
- Ruby 3.4.5+ (Homebrew推奨)
- Node.js (Mermaid CLI用)

### インストール
```bash
# Ruby gems
/opt/homebrew/Cellar/ruby/3.4.5/bin/gem install asciidoctor asciidoctor-pdf asciidoctor-revealjs asciidoctor-diagram asciidoctor-diagram-plantuml asciidoctor-diagram-ditaamini

# Mermaid CLI
npm install -g @mermaid-js/mermaid-cli
```

## ファイル構成

```
├── sample.adoc           # メインのプレゼンテーション源泉
├── build.sh              # ビルドスクリプト
├── package.json          # npm設定
├── themes/
│   └── japanese-theme.yml # PDF用日本語テーマ
└── output/               # 生成ファイル
    ├── slides.html       # インタラクティブスライド
    ├── handout.pdf       # PDF配布資料
    └── document.html     # 標準HTML
```

## 対応する図表

- **Mermaid** - フローチャート、ガントチャート、アーキテクチャ図
- **PlantUML** - UML図、システム図
- **Ditaa** - ASCII アートダイアグラム

## 使用技術

- AsciiDoc + Asciidoctor
- Reveal.js (スライド)
- asciidoctor-pdf (PDF生成)
- asciidoctor-diagram (図表エクステンション)

## ライセンス

MIT