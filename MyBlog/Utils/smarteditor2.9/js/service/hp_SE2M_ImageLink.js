nhn.husky.SE2M_ImageLink = jindo.$Class({
    name: "SE2M_ImageLink",
    acceptbutton1: null,
    closebutton1: null,
    $init: function (elAppContainer) {
        this._assignHTMLObjects(elAppContainer);
    },
    _assignHTMLObjects: function (elAppContainer) {
        this.oImageLayer = cssquery.getSingle("DIV.husky_seditor_imagelinker_layer", elAppContainer);
        this.acceptbutton1 = cssquery.getSingle(".se2_apply", this.oImageLayer);
        this.closebutton1 = cssquery.getSingle(".se2_cancel", this.oImageLayer);
        this.ImageInput = cssquery.getSingle("INPUT", this.oImageLayer);
    },
    $ON_MSG_APP_READY: function () {
        this.oApp.exec("REGISTER_UI_EVENT", ["imagelinker", "click", "SE2_TOGGLE_ImageLINK_LAYER"]);
        this.oApp.registerBrowserEvent(this.acceptbutton1, "click", "MSG_IMAGELINK_ACCEPT");
        this.oApp.registerBrowserEvent(this.closebutton1, "click", "MSG_IMAGELINK_CLOSE");
    },
    $ON_SE2_TOGGLE_ImageLINK_LAYER: function () {
        this.oApp.exec("TOGGLE_TOOLBAR_ACTIVE_LAYER", [this.oImageLayer]);
    },
    $ON_MSG_IMAGELINK_ACCEPT: function () {
        var ImageSrc = "";
        var EditorObject = this.oApp;
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            var size = this.ImageInput.files[0].size;
            // Only process image files.
            if (!this.ImageInput.files[0].type.match('image.*')) {
                alert("이미지 형식의 파일만 가능합니다.");
                this.oApp.exec("SE2_TOGGLE_ImageLINK_LAYER", []);
                return;
            }
            var file = this.ImageInput.files[0];
            var reader = new FileReader();
            reader.onload = function (event) {
                ImageSrc = "<img src=\"" + event.target.result + "\" alt=\"\"/>";
                EditorObject.exec("PASTE_HTML", [ImageSrc]);
            };
            reader.readAsDataURL(file);
        } else {
            alert('The File APIs are not fully supported in this browser.');
        }
        this.oApp.exec("SE2_TOGGLE_ImageLINK_LAYER", []);
    },
    $ON_MSG_IMAGELINK_CLOSE: function () {
        this.oApp.exec("SE2_TOGGLE_ImageLINK_LAYER", []);
    }
});