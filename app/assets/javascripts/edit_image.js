$(document).on('turbolinks:load', function() { 

  var fileName;

  function initalCrop() {
    var $crop_area_box = $('#crop_area_box');
        $crop_area_box.empty();
        $crop_area_box.append($('<img>').attr({
          src: "main-image.jpg",
          id: "crop_image",
        }));
  }

  // 画像ファイル選択後のプレビュー処理
  $('form').on('change', 'input[type="file"]', function(event) {
    var file = event.target.files[0];
    fileName = file.name;
    var reader = new FileReader();
    var $crop_area_box = $('#crop_area_box');
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf('image') < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(event) {
        //既存のプレビューを削除
        $crop_area_box.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $crop_area_box.append($('<img>').attr({
          src: event.target.result,
          id: "crop_image",
          title: file.name
        }));
        // プレビュー処理に対して、クロップ出来る処理を初期化設定
        initCrop();
      };
    })(file);
    reader.readAsDataURL(file);
  });

  var cropper;
  function initCrop() {
    cropper = new Cropper(crop_image, {
      dragMode: 'move', // 画像を動かす設定
      aspectRatio: 3 / 4, // 正方形やで！
      restore: false,
      guides: false,
      center: false,
      highlight: false,
      cropBoxMovable: false,
      cropBoxResizable: false,
      toggleDragModeOnDblclick: false,
      minCropBoxWidth: 300,
      minCropBoxHeight: 400,
      ready: function () {
        croppable = true;
      },
      crop: function (e) {
        var data = e.detail;
        console.log(e.type);
        console.log("X座標:" , Math.round(data.x));
        console.log("Y座標:" , Math.round(data.y));
        console.log("高さ:" , Math.round(data.height));
        console.log("幅:" , Math.round(data.width));
        $('#cloth_upload_image_x').val(Math.round(data.x));
        $('#cloth_upload_image_y').val(Math.round(data.y));
        $('#cloth_upload_image_h').val(Math.round(data.height));
        $('#cloth_upload_image_w').val(Math.round(data.width));
      }
    });
    // 初回表示時
    crop_image.addEventListener('ready', function(e){
      cropping(e);
    });
    // 画像をドラッグした際の処理
    crop_image.addEventListener('cropend', function(e){
      cropping(e);
      cropper.clop;
    });
    // 画像を拡大・縮小した際の処理
    crop_image.addEventListener('zoom', function(e){
      cropping(e);
    });
  }

  // クロップ処理した画像をプレビュー領域に表示
  var croppedCanvas;
  function cropping(e) {
    croppedCanvas = cropper.getCroppedCanvas({
      width: 300,
      height: 300,
    });
    // `$('<img>'{src: croppedCanvas.toDataURL()});` 的に書きたかったけど、jQuery力が足りず・・・
    var croppedImage = document.createElement('img');
    crop_preview = $('#crop_image');
    croppedImage.src = croppedCanvas.toDataURL();
    // crop_preview.innerHTML = '';
    // crop_preview.appendChild(croppedImage);
  }


});