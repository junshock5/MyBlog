nhn.husky.SE2M_PreviewDocument = jindo.$Class({
    name: "SE2M_PreviewDocument",
    $init: function (elAppContainer) {
        this._assignHTMLObjects(elAppContainer);
    },
    _assignHTMLObjects: function (elAppContainer) {
        this.oPreviewLayer = cssquery.getSingle("DIV.husky_seditor_ui_preview", elAppContainer);
    },
    $ON_MSG_APP_READY: function () {
        this.oApp.exec("REGISTER_UI_EVENT", ["preview", "click", "SE2_TOGGLE_PREVIEW_LAYER"]);
    },
    $ON_SE2_TOGGLE_PREVIEW_LAYER: function () {
		document.getElementById("previewContents").value = this.oApp.getIR();
		var hWnd = window.open("/web/approval/Utils/SmartEditor2.9/Preview.html", "previewWindow", "width=800,height=600,scrollbars=yes,resizable=0");
		if (hWnd == null) {
			alert("팝업창 차단 설정을 풀어주세요.");
			return;
		}
		hWnd.focus();
    }
});