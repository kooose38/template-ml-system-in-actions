# template pattern

## 目的

`.onnx`を使った推論期の構築を行います。

## 前提

- Python 3.8 以上

## 使い方

#### `template`の作成


1. モデルの入出力に合わせたフォーマットで`vars.yaml`を修正する

```
    name: 推論器の名称
    model_file_name: sample.onnx # modelのファイル名
    label_file_name: label.json # labelsのファイル名
    data_type: float32 # データ型
    data_structure: (1,4) # データの形状
    data_sample: [[5.1, 3.5, 1.4, 0.2]] # サンプルデータ
    prediction_type: float32 # 予測の型
    prediction_structure: (1,3)
    prediction_sample: [0.97093159, 0.01558308, 0.01348537]
    port: 8000 # 推論器の公開ポート
```

2. `docker-compose.yml`と`Dockerfile`の**PROJECT_NAME**の修正
  
推論器のフォルダ名になる


3. `makefile`のコマンドを上から実行する
  
build->push->compose up->cp->rm  
ここまでで推論用のファイルが作成される


4. モデルの追加と推論クラスの修正

`./NEW_DIR/models/`に**model_file_name**`.onnx` と**label_file_name**<label.json>を追加する
`./NEW_DIR/src/ml/prediction.py`の修正

#### 推論サーバーの実行

1. `./NEW_DIR/makefile`を実行する

```
  $ make build 
  $ make run または $ make push | make c_up # PORTが立ち上がるのでAPIを利用できる

  $ make c_down 
  $ make rm 

```
