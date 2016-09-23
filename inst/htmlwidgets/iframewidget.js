HTMLWidgets.widget({

  name: 'iframewidget',

  type: 'output',

  factory: function(el, width, height) {
    return {
      renderValue: function(x) {
        var iframe = document.createElement('iframe');
        iframe.width = width;
        iframe.height = height;
        iframe.id = x.elementId;
        iframe.frameBorder = '0';
        iframe.webkitallowfullscreen = '';
        iframe.mozallowfullscreen = '';
        iframe.allowfullscreen='';
        iframe.sandbox='allow-forms allow-scripts allow-popups allow-same-origin allow-pointer-lock'
        iframe.src = x.src;

        el.appendChild(iframe);
      },
      resize: function(width, height) {
      }
    };
  }
});
