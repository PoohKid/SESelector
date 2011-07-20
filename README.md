# SESelector
*リソース内の音声ファイルをテスト再生します。*
## 使い方
1. 再生したいリソースファイルをプロジェクトに追加します。
2. viewDidLoadで設定してるリストにリソース名、拡張子、タイトルを記述します。何個でも記述できます。
3. 実行するとTableViewにリソース名の一覧が表示されます。選択すると音声ファイルが再生されます。
## リストにリソースを追加するコード
    seList_ = [[NSArray arrayWithObjects:
                [[[KeyValuePair alloc] initWithResource:@"" ofType:@"" key:@""] autorelease],
                nil] retain];
## 注意点
アップする際にリソースファイルなどいくつか削除したものがあるので、もしかしたらビルドエラーが出るかもしれません。
その際は直接お伝え下さい。
