# Right Guardians アプリケーション仕様書

## 1. アプリケーション概要

### 1.1 サービス名
**Right Guardians（ライトガーディアンズ）**

### 1.2 サービス概要
オンラインゲーム「Destiny2」のプレイヤー向けフレンドマッチングサービス。プレイヤー同士が理想的な仲間を見つけるためのプラットフォームで、プレイスタイルやスキルレベルに基づいてマッチングを行う。

### 1.3 主な機能
- ユーザー登録・プロフィール管理
- フレンド募集投稿
- レイド募集投稿（マイクロポスト）
- 自慢の一枚投稿（画像投稿）
- いいね・コメント・フォロー機能
- 通知システム
- ランキング機能
- 検索機能

### 1.4 技術スタック
- **フレームワーク**: Ruby on Rails 6.1.3.1
- **Ruby バージョン**: 2.6.9
- **データベース**: MySQL 8.0.19
- **フロントエンド**: Slim, SCSS, jQuery, Bootstrap 4
- **認証**: Devise
- **画像アップロード**: CarrierWave + MiniMagick
- **検索**: Ransack
- **ページネーション**: Kaminari
- **インフラ**: AWS (EC2, RDS), Nginx, Unicorn

## 2. データベース構造

### 2.1 主要テーブル

#### users（ユーザー）
ユーザーアカウントとプロフィール情報を管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| email | string | メールアドレス（ログインID） |
| encrypted_password | string | 暗号化パスワード |
| name | string | ユーザー名 |
| profile | text | プロフィール文 |
| image | string | プロフィール画像 |
| clan | string | 所属クラン |
| psnid | string | PlayStation Network ID |
| sex | string | 性別 |
| level | integer | レベル |
| lightlevel | integer | 光レベル |
| model | string | キャラクターモデル |
| timezone | string | タイムゾーン |
| voice | string | ボイスチャット可否 |
| style | string | プレイスタイル |
| admin | boolean | 管理者フラグ |
| strength | float | 戦闘力 |
| profession | string | 職業/クラス |
| twitter | string | Twitterアカウント |
| steam | string | Steamアカウント |
| carreer | string | キャリア |
| weapon | string | 得意武器 |

#### friends（フレンド募集投稿）
フレンド募集の投稿を管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| name | string | 募集タイトル（最大30文字） |
| description | text | 募集詳細（最大400文字） |
| model | string | モデル/タイプ |
| user_id | integer | 投稿者ID |

#### posts（自慢の一枚投稿）
画像付き投稿を管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| content | string | 投稿タイトル（最大30文字） |
| description | text | 投稿説明（最大400文字） |
| image | string | 投稿画像 |
| user_id | bigint | 投稿者ID |

#### microposts（レイド募集投稿）
レイド/アクティビティ募集を管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| model | string | アクティビティ種別 |
| content | string | 募集内容 |
| name_type | string | 名前タイプ |
| raid_time | string | レイド予定時刻 |
| description | text | 詳細説明（最大400文字） |
| user_id | bigint | 投稿者ID |

#### relationships（フォロー関係）
ユーザー間のフォロー関係を管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| follower_id | integer | フォローする側のユーザーID |
| following_id | integer | フォローされる側のユーザーID |

#### likes（いいね）
投稿へのいいねを管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| post_id | bigint | いいね対象の投稿ID |
| user_id | bigint | いいねしたユーザーID |

#### comments（コメント）
フレンド募集投稿へのコメントを管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| content | text | コメント内容（最大200文字） |
| user_id | integer | コメント投稿者ID |
| friend_id | integer | コメント対象のフレンド募集ID |

#### comment_microposts（マイクロポストコメント）
レイド募集へのコメントを管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| comment | text | コメント内容 |
| user_id | bigint | コメント投稿者ID |
| micropost_id | bigint | コメント対象のマイクロポストID |

#### notifications（通知）
各種アクションの通知を管理

| カラム名 | 型 | 説明 |
|---------|-----|------|
| visitor_id | integer | アクションを行ったユーザーID |
| visited_id | integer | 通知を受けるユーザーID |
| post_id | integer | 関連投稿ID（いいね時） |
| comment_id | integer | 関連コメントID |
| friend_id | integer | 関連フレンド募集ID |
| action | string | アクション種別（like/comment/follow） |
| checked | boolean | 既読フラグ |

## 3. 主要機能仕様

### 3.1 ユーザー管理機能

#### 3.1.1 新規登録
- メールアドレスとパスワードで登録
- 登録時に名前とプロフィール画像を設定可能
- Devise標準機能を使用

#### 3.1.2 ログイン
- メールアドレスとパスワードでログイン
- ゲストログイン機能あり（投稿以外の操作が制限される）
- ログイン状態の保持（Remember me）対応

#### 3.1.3 プロフィール編集
- ゲーム関連情報（レベル、光レベル、クラン等）の編集
- SNSアカウント連携（Twitter、Steam、PSN ID）
- プロフィール画像のアップロード（CarrierWave使用）

### 3.2 投稿機能

#### 3.2.1 フレンド募集投稿
- タイトル（最大30文字、カンマ禁止）と説明文（最大400文字）で投稿
- 投稿一覧表示（ページネーション対応）
- 検索機能（Ransack使用）
- コメント機能

#### 3.2.2 自慢の一枚投稿
- 画像必須の投稿機能
- タイトル（最大30文字）と説明文（最大400文字）
- いいね機能（Ajax対応）
- ランキング表示（いいね数上位5件）

#### 3.2.3 レイド募集投稿
- アクティビティ種別、募集内容、レイド時刻を設定
- 詳細説明（最大400文字）
- コメント機能

### 3.3 ソーシャル機能

#### 3.3.1 フォロー機能
- ユーザー間のフォロー/アンフォロー
- フォロー/フォロワー一覧表示
- フォロー時の通知

#### 3.3.2 いいね機能
- 自慢の一枚投稿への「いいね」
- Ajax対応でページ遷移なし
- いいね時の通知
- 一人一投稿につき1いいねまで

#### 3.3.3 コメント機能
- フレンド募集とレイド募集へのコメント
- 最大200文字
- コメント時の通知

### 3.4 通知機能
- フォロー、いいね、コメント時に通知を生成
- 未読/既読管理
- 通知一覧表示（ページネーション対応）
- 一括削除機能

### 3.5 検索機能
- ユーザー検索（名前、プロフィール）
- フレンド募集検索（タイトル、説明文）
- 自慢の一枚検索（タイトル、説明文）
- レイド募集検索（各種条件）
- Ransackによる複数条件検索

### 3.6 管理機能
- 管理者ユーザー（adminフラグ）
- 不適切な投稿の削除権限
- ユーザー管理

## 4. 画面遷移

### 4.1 未ログイン時
- トップページ → 新規登録/ログイン
- 各種投稿の閲覧のみ可能
- 投稿、いいね、コメント、フォローは不可

### 4.2 ログイン時
- トップページ → 各種投稿一覧
- マイページ（プロフィール表示/編集）
- 投稿作成/編集/削除
- 他ユーザーのプロフィール閲覧/フォロー
- 通知確認

### 4.3 ゲストユーザー
- 閲覧機能のみ利用可能
- 投稿、編集、削除機能は制限

## 5. API仕様

### 5.1 ルーティング概要

#### ユーザー関連
- `GET /users` - ユーザー一覧
- `GET /users/:id` - ユーザー詳細
- `GET /users/:id/edit` - ユーザー編集
- `PATCH/PUT /users/:id` - ユーザー更新
- `GET /users/:id/friend` - ユーザーのフレンド募集一覧
- `GET /users/:id/post` - ユーザーの投稿一覧
- `GET /users/:id/like` - ユーザーのいいね一覧
- `GET /users/:id/micropost` - ユーザーのレイド募集一覧

#### 投稿関連
- `GET /friends` - フレンド募集一覧
- `GET /friends/:id` - フレンド募集詳細
- `POST /friends` - フレンド募集作成
- `PATCH/PUT /friends/:id` - フレンド募集更新
- `DELETE /friends/:id` - フレンド募集削除

- `GET /posts` - 自慢の一枚一覧
- `GET /posts/:id` - 自慢の一枚詳細
- `GET /posts/ranking` - ランキング表示
- `POST /posts` - 投稿作成
- `PATCH/PUT /posts/:id` - 投稿更新
- `DELETE /posts/:id` - 投稿削除

- `GET /microposts` - レイド募集一覧
- `GET /microposts/:id` - レイド募集詳細
- `POST /microposts` - レイド募集作成
- `PATCH/PUT /microposts/:id` - レイド募集更新
- `DELETE /microposts/:id` - レイド募集削除

#### ソーシャル機能
- `POST /relationships` - フォローする
- `DELETE /relationships/:id` - フォロー解除
- `POST /likes` - いいねする
- `DELETE /likes/:id` - いいね解除
- `POST /comments` - コメント投稿
- `DELETE /comments/:id` - コメント削除

#### 認証関連（Devise）
- `POST /users` - 新規登録
- `POST /users/sign_in` - ログイン
- `DELETE /users/sign_out` - ログアウト
- `POST /users/guest_sign_in` - ゲストログイン

## 6. セキュリティ考慮事項

### 6.1 認証・認可
- Deviseによる認証機能
- 一部のコントローラで認証チェックが不足している問題あり
- 認可機能が不完全（他ユーザーのプロフィール編集が可能な脆弱性）

### 6.2 推奨される改善点
1. すべてのコントローラで適切な認証チェックを実装
2. 認可機能の実装（CanCanCan等の導入を推奨）
3. Strong Parametersの徹底
4. CSRF対策の確認
5. XSS対策（特に画像アップロード部分）

## 7. パフォーマンス最適化

### 7.1 実装済み
- ページネーション（Kaminari）
- 画像リサイズ（MiniMagick）
- インプレッション追跡（impressionist）

### 7.2 推奨される改善点
1. N+1クエリの解消（includes使用）
2. キャッシュの活用
3. 画像のCDN配信
4. データベースインデックスの最適化

## 8. 運用・保守

### 8.1 デプロイ
- Capistranoによる自動デプロイ設定済み
- AWS EC2 + RDS構成
- Nginx + Unicorn

### 8.2 監視・分析
- Google Analytics導入済み
- impressionistによるPV追跡
- エラー監視ツールの導入推奨

### 8.3 定期タスク
- wheneverによるcron管理
- サイトマップ生成（sitemap_generator）

## 9. 今後の拡張可能性

### 9.1 機能追加案
1. リアルタイムチャット機能
2. ゲーム実績の自動取得（API連携）
3. マッチング精度の向上（AI/ML活用）
4. モバイルアプリ対応
5. 多言語対応

### 9.2 技術的改善案
1. Rails 7へのアップグレード
2. フロントエンドのモダン化（React/Vue.js）
3. GraphQL APIの提供
4. マイクロサービス化
5. コンテナ化（Docker/Kubernetes）