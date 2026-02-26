# 日報 × 感情ログアプリ

Rails 8.1.2 で構築された日報管理アプリケーションです。日報に感情を紐付けて記録し、感情の推移を可視化することができます。

## 機能概要

### 基本機能
- **日報の作成・編集・削除**: Markdown 対応のテキストエディタ
- **感情の記録**: 6種類の感情から選択（ハッピー、悲しい、怒り、疲れた、興奮、落ち着き）
- **画像アップロード**: ActiveStorage による画像添付機能
- **タグ管理**: カンマ区切りでタグを付与可能

### 検索機能
- **全文検索**: タイトル・本文・感情・タグで検索
- **絞り込み**: 感情やタグでのフィルタリング

### ダッシュボード
- **感情推移グラフ**: 日別・週別・月別の感情推移を可視化
- **タグ分析**: タグ別投稿数の円グラフ表示
- **統計情報**: 投稿数や感情分布の集計

### UI/UX
- **リアルタイムプレビュー**: Markdown のリアルタイムプレビュー
- **タグ自動補完**: 入力時のタグ候補表示
- **レスポンシブデザイン**: Tailwind CSS によるモダンなデザイン

## 技術スタック

### フレームワーク
- Ruby on Rails 8.1.2
- Ruby 3.4.0

### フロントエンド
- Tailwind CSS 3.4.0
- Stimulus 4.0
- Chart.js 4.4.0

### データベース
- SQLite3 (開発環境)
- PostgreSQL (本番環境推奨)

### 認証・認可
- Devise 4.9.4
- Strong Parameters

### 画像処理
- ActiveStorage
- ImageProcessing

### 検索
- Ransack 4.2.0

### 開発ツール
- RuboCop
- RSpec (テスト)

## 環境要件

- Ruby 3.4.0 以上
- Node.js 18 以上
- SQLite3 または PostgreSQL

## インストール手順

### 1. リポジトリのクローン
```bash
git clone https://github.com/your-username/daily-log-app.git
cd daily-log-app
```

### 2. 必要な gem のインストール
```bash
bundle install
```

### 3. データベースのセットアップ
```bash
# データベース作成とマイグレーション
bin/rails db:setup

# サンプルデータの投入
bin/rails db:seed
```

### 4. 開発サーバーの起動
```bash
bin/dev
```

### 5. ブラウザでアクセス
```
http://localhost:3000
```

## 初期ユーザー

シードデータで以下のユーザーが作成されます：

- **メール**: user1@example.com
- **パスワード**: password123

## ディレクトリ構成

```
app/
├── models/
│   ├── user.rb (Devise)
│   ├── report.rb
│   ├── emotion.rb
│   ├── tag.rb
│   └── report_tag.rb
├── controllers/
│   ├── reports_controller.rb
│   ├── emotions_controller.rb
│   ├── tags_controller.rb
│   └── dashboards_controller.rb
├── views/
│   ├── reports/
│   ├── emotions/
│   ├── tags/
│   └── dashboards/
├── javascript/
│   └── controllers/
│       ├── markdown_preview_controller.js
│       └── tag_autocomplete_controller.js
└── assets/
    └── stylesheets/
        └── application.css (Tailwind)

config/
├── routes.rb
├── tailwind.config.js
└── devise.rb

db/
├── migrate/
├── seeds.rb
└── schema.rb

test/
├── models/
│   ├── report_test.rb
│   ├── emotion_test.rb
│   ├── tag_test.rb
│   └── user_test.rb
└── controllers/
    └── reports_controller_test.rb
```

## 開発フロー

### モデルの追加
```bash
# モデルとマイグレーションの生成
bin/rails generate model NewModel name:string description:text

# マイグレーションの実行
bin/rails db:migrate
```

### コントローラの追加
```bash
# コントローラの生成
bin/rails generate controller NewController

# ルーティングの追加
# config/routes.rb に追記
```

### テストの実行
```bash
# 全テストの実行
bin/rails test

# 特定のテストファイルの実行
bin/rails test test/models/report_test.rb
```

### コード品質チェック
```bash
# RuboCop でコードチェック
bin/rubocop

# 自動修正
bin/rubocop -A
```

## デプロイ手順

### Heroku へのデプロイ例

1. **Heroku CLI のインストール**
```bash
# Heroku CLI をインストール
curl https://cli-assets.heroku.com/install.sh | sh
```

2. **Heroku アプリの作成**
```bash
heroku create your-app-name
```

3. **PostgreSQL の追加**
```bash
heroku addons:create heroku-postgresql:hobby-dev
```

4. **環境変数の設定**
```bash
heroku config:set SECRET_KEY_BASE=$(bin/rails secret)
heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)
```

5. **デプロイ**
```bash
git push heroku main
```

6. **データベースのセットアップ**
```bash
heroku run rails db:setup
```

### Docker での実行

1. **Dockerfile が含まれています**
2. **ビルドと実行**
```bash
docker build -t daily-log-app .
docker run -p 3000:3000 daily-log-app
```

## API エンドポイント

### 日報
- `GET /reports` - 一覧表示
- `GET /reports/:id` - 詳細表示
- `POST /reports` - 作成
- `PATCH /reports/:id` - 編集
- `DELETE /reports/:id` - 削除

### 感情
- `GET /emotions` - 一覧表示
- `GET /emotions/:id` - 詳細表示

### タグ
- `GET /tags` - 一覧表示
- `GET /tags/:id` - 詳細表示

### ダッシュボード
- `GET /dashboard` - 統計情報表示

## カスタマイズ方法

### 感情の追加
```ruby
# db/seeds.rb で感情を追加
Emotion.create!(name: 'new_emotion', color: '#color_code')
```

### タグの自動補完カスタマイズ
```javascript
// app/javascript/controllers/tag_autocomplete_controller.js
// カスタムロジックを追加
```

### ダッシュボードのグラフカスタマイズ
```javascript
// app/javascript/controllers/dashboard_controller.js
// Chart.js の設定を変更
```

## トラブルシューティング

### データベース接続エラー
```bash
# データベースの再作成
bin/rails db:drop db:create db:migrate
```

### 画像アップロードエラー
```bash
# ActiveStorage の設定を確認
# config/storage.yml を確認
```

### CSS が反映されない
```bash
# Tailwind のビルドを再実行
npm run build:css
```

## ライセンス

MIT License

## 作者

[Your Name]

## お問い合わせ

質問やバグ報告は GitHub Issues までお願いします。