# Golang Docker Web Application

GinとMySQLを使ったWebアプリケーションです。
DockerとDocker Composeを使用して開発環境を構築できます。

## 必要な環境

- Docker
- Docker Compose
- Git

## 環境構築手順

### 1. リポジトリのクローン

```bash
git clone git@github.com:naonao3040/golang-docker.git
cd golang-docker
```

### 2. 環境変数ファイルの作成

プロジェクトルートに`.env`ファイルを作成し、以下の内容を記述してください。
下記は例となるので設定する値は各自で調整してください。

```bash
# MySQL設定
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=your_app
MYSQL_USER=your_db_user
MYSQL_PASSWORD=your_db_password

# アプリケーション設定
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_HOST=mysql
DB_PORT=3306
DB_NAME=your_app
```

### 3. アプリケーションの起動

```bash
docker-compose up -d
```

### 4. 動作確認

アプリケーションが起動したら、以下のURLにアクセスして動作を確認できます。

- http://localhost:8080

## 開発環境の特徴

- **マルチステージビルド**: 開発用と本番用で最適化されたDockerイメージ
- **Live Reload**: Airを使用した自動リロード機能
- **ボリュームマウント**: ホストのファイル変更がリアルタイムでコンテナに反映

## 利用可能なAPI

### アルバム管理

- `GET /` - ホーム
- `GET /albums` - アルバム一覧取得
- `GET /albums/:id` - アルバム詳細取得
- `POST /albums` - アルバム作成
- `PATCH /albums/:id` - アルバム更新
- `DELETE /albums/:id` - アルバム削除

## トラブルシューティング

### コンテナが起動しない場合

```bash
# ログを確認
docker-compose logs

# コンテナを停止して再起動
docker-compose down
docker-compose up --build  # 問題がある場合は再ビルド
```

### データベース接続エラーの場合

```bash
# MySQLコンテナの状態を確認
docker-compose ps

# MySQLコンテナのログを確認
docker-compose logs mysql
```
