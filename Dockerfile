FROM node:16.10.0-alpine3.14

# # 静的コンテンツを配信するシンプルな http サーバをインストールする
RUN npm install -g http-server

# # カレントワーキングディレクトリとして 'app' フォルダを指定する
WORKDIR /app

# # `package.json` と `package-lock.json` （あれば）を両方コピーする
COPY package*.json ./

# # プロジェクトの依存ライブラリをインストールする
RUN npm install

# # カレントワーキングディレクトリ(つまり 'app' フォルダ)にプロジェクトのファイルやフォルダをコピーする
COPY . .

# # 本番向けに圧縮しながらアプリケーションをビルドする
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]