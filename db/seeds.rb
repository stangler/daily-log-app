# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー作成
puts 'Creating users...'
user1 = User.find_or_create_by!(email: 'user1@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

user2 = User.find_or_create_by!(email: 'user2@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# 感情作成
puts 'Creating emotions...'
emotions = [
  { name: 'happy', color: '#4CAF50' },
  { name: 'sad', color: '#2196F3' },
  { name: 'angry', color: '#F44336' },
  { name: 'tired', color: '#9C27B0' },
  { name: 'excited', color: '#FF9800' },
  { name: 'calm', color: '#00BCD4' }
]

emotions.each do |emotion_data|
  Emotion.find_or_create_by!(name: emotion_data[:name]) do |emotion|
    emotion.color = emotion_data[:color]
  end
end

# タグ作成
puts 'Creating tags...'
tags = [
  # 開発系
  'Rails', 'React', 'JavaScript', 'CSS', 'HTML', 'Git',
  # 業務系
  'ミーティング', 'レビュー', '見積もり', 'ドキュメント',
  # 感情系
  'モチベーション', 'ストレス', '達成感', '学習',
  # プロジェクト系
  '新規開発', '保守', 'リファクタリング', '緊急対応',
  # 日常生活系
  '朝活', '運動', '読書', '料理', '掃除', '買い物', '通勤', '睡眠'
]

tags.each do |tag_name|
  Tag.find_or_create_by!(name: tag_name)
end

# 日報作成
puts 'Creating reports...'

# 開発日報
reports_data = [
  {
    title: 'Railsアプリの新機能実装',
    content: "今日はRailsアプリに新しい機能を実装しました。
    
## 今日の出来事
- ユーザー管理機能の追加
- データベース設計を見直し
- APIエンドポイントを作成

## 反省
- マイグレーションの設計が甘かった
- エラーハンドリングが不足していた

## 明日の予定
- テストコードを書く
- ドキュメントを整備する",
    emotion_name: 'happy',
    tags: ['Rails', '新規開発', 'API']
  },
  {
    title: 'Reactコンポーネントのバグ修正',
    content: "Reactのコンポーネントでバグが発生し、修正に時間がかかりました。
    
## 今日の出来事
- 状態管理の問題を特定
- レンダリングの無限ループを修正
- テストケースを追加

## 反省
- 事前のテストが不十分だった
- コードレビューを早めに依頼すべきだった

## 明日の予定
- 他のコンポーネントのチェック
- パフォーマンス改善",
    emotion_name: 'sad',
    tags: ['React', '保守', 'バグ修正']
  },
  {
    title: 'CSSデザインの調整',
    content: "デザインチームからのフィードバックに基づき、CSSを大幅に調整しました。
    
## 今日の出来事
- レスポンシブデザインに対応
- カラーパレットを統一
- アニメーション効果を追加

## 反省
- デザインシステムを事前に確認すべきだった
- ブラウザ間の互換性を考慮不足

## 明日の予定
- ユーザーテストを実施
- パフォーマンス検証",
    emotion_name: 'excited',
    tags: ['CSS', 'デザイン', 'レスポンシブ']
  },
  {
    title: 'Gitのマージ作業',
    content: "チームメンバーとのコード統合作業を行いました。
    
## 今日の出来事
- マージコンフリクトを解決
- ブランチ整理
- コミットメッセージの統一

## 反省
- こまめにプルリクエストを出すべきだった
- コミットの粒度が大きすぎた

## 明日の予定
- 新しい機能ブランチを作成
- コードレビューを依頼",
    emotion_name: 'tired',
    tags: ['Git', 'チーム開発', 'マージ']
  },
  {
    title: 'コードレビュー',
    content: "同僚のコードレビューを行いました。
    
## 今日の出来事
- 新しい実装パターンを学んだ
- 最適化のアイデアを共有
- テストコードの改善点を発見

## 反省
- もっと細かくチェックすべきだった
- 質問をもっと積極的にすべきだった

## 明日の予定
- 自分のコードもレビュー依頼
- 学んだことを実践",
    emotion_name: 'calm',
    tags: ['レビュー', '学習', 'チーム']
  },
  {
    title: '要件定義ミーティング',
    content: "新規プロジェクトの要件定義ミーティングに参加しました。
    
## 今日の出来事
- クライアントの要望をヒアリング
- 技術的制約を確認
- スケジュールの見積もり

## 反省
- 質問が足りなかった
- 技術的リスクをもっと深掘りすべきだった

## 明日の予定
- 要件定義書を作成
- 技術調査を進める",
    emotion_name: 'excited',
    tags: ['ミーティング', '要件定義', 'プロジェクト管理']
  },
  {
    title: '進捗報告',
    content: "週次の進捗報告を行いました。
    
## 今日の出来事
- 先週の成果をまとめた
- 問題点を共有
- 今週の目標を設定

## 反省
- 数値で表せる成果が少なかった
- リスク共有が遅れた

## 明日の予定
- タスクの優先順位を見直す
- チームメンバーと相談",
    emotion_name: 'tired',
    tags: ['ミーティング', '進捗管理', '報告']
  },
  {
    title: '見積もり作業',
    content: "新しい機能の見積もりを行いましたが、大幅に甘く出てしまいました。
    
## 今日の出来事
- タスクを細分化
- リスク要因を洗い出し
- バッファを見積もり

## 反省
- 経験則に頼りすぎた
- チームメンバーの意見を聞くべきだった

## 明日の予定
- 再見積もりを行う
- リスク管理計画を作成",
    emotion_name: 'angry',
    tags: ['見積もり', 'プロジェクト管理', 'リスク']
  },
  {
    title: 'ドキュメント作成',
    content: "プロジェクトの技術ドキュメントを作成しました。
    
## 今日の出来事
- API仕様書を整備
- 開発環境構築手順を作成
- コード規約をドキュメント化

## 反省
- 図式が不足していた
- 用語の統一が不十分

## 明日の予定
- ドキュメントのレビュー
- チーム共有",
    emotion_name: 'calm',
    tags: ['ドキュメント', '整理', '規約']
  },
  {
    title: 'テスト作業',
    content: "ユニットテストと統合テストを充実させました。
    
## 今日の出来事
- カバレッジを80%以上に向上
- モックの使い方を改善
- CIパイプラインを最適化

## 反省
- テストケースが網羅的ではなかった
- テストデータの管理が雑だった

## 明日の予定
- パフォーマンステストを追加
- テスト自動化を進める",
    emotion_name: 'happy',
    tags: ['テスト', '品質管理', '自動化']
  }
]

reports_data.each do |report_data|
  user = user1 # 個人用アプリなのでuser1だけ使用
  emotion = Emotion.find_by!(name: report_data[:emotion_name])
  
  report = Report.create!(
    title: report_data[:title],
    content: report_data[:content],
    user: user,
    emotion: emotion
  )
  
  # 指定されたタグを追加
  report_data[:tags].each do |tag_name|
    tag = Tag.find_or_create_by!(name: tag_name)
    report.tags << tag
  end
end

puts 'Seeding completed!'