# LP モノレポ — 複数LP案件をまとめて管理

高CVRなLPを作るための共通ナレッジ + 案件ごとのLP本体を1リポジトリで管理する。

## 構成

```
CLAUDE.md                         … このファイル（リポジトリ全体のルール）
knowledge/                        … 案件をまたいで使う共通ナレッジ
  01_lp-theory/                   … LP構成理論・CVR最適化（PASONA/FV/CTA/EFO等）
  04_ad-and-measurement/          … 広告受け皿LP設計・LINE誘導CVフロー・GA4計測・法規制
projects/                         … 案件ごとに1フォルダ
  nexte-pilates/                  … NEXTE マシンピラティス習得プログラムLP
  ths-supporter/                  … 助野トータルヒップサポーターLP（一般向け/医療機関向けの2種）
```

## ルール

- **新しいLP案件は `projects/<案件名>/` を作って始める。** 案件フォルダ直下に必ず `CLAUDE.md`（案件の指示書・ブリーフ）を置く
- 案件をまたいで使える一般ノウハウはルートの `knowledge/` へ、案件固有の競合分析・顧客インサイトは各案件フォルダ内へ
- ナレッジファイルは `YYYY-MM-DD_タイトル.md` 形式、出典URL必須
- LP制作時は knowledge/ を参照し、根拠のある構成・コピーにする
- 薬機法・景表法・医療広告ガイドラインのNG表現（断定・最大級・裏付けのない権威表現）は全案件共通で禁止。詳細は各案件のCLAUDE.mdに従う

## 各案件の状況

| 案件 | 状態 | 備考 |
|---|---|---|
| nexte-pilates | 完成・WP固定ページ311下書き済 | CV=LINE経由体験申込。詳細は `projects/nexte-pilates/CLAUDE.md` |
| ths-supporter | 完成（レビュー10周×2LP済） | 旧リポジトリ `takuro-locomo/THS-LP` から移管。以後の編集はこちらで行う。残タスクは `HANDOFF.md` |
