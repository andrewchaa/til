**Display the whole pdf**

```javascript
$(document).ready(function() {
    PDFJS.workerSrc = 'pdf.worker.js';
    PDFJS.getDocument('Rules.pdf').then(function (pdf) {

        var viewer = document.getElementById('pdfViewer');
        var handlePages = function (page) {
            var canvas = document.createElement('canvas');

            console.log('viewer width: ' + viewer.offsetWidth);
            console.log('page width: ' + page.getViewport(1.0).width);
            console.log('calculation: ' + viewer.offsetWidth / page.getViewport(1.0).width);
            
            var viewport = page.getViewport(viewer.offsetWidth / page.getViewport(1.0).width);
            if (viewer.offsetWidth == 0) {
                viewport = page.getViewport(1.40);
            }
            
            var context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;
            canvas.style.display = 'block';

            // Render PDF page into canvas context.
            var renderContext = {
                canvasContext: context,
                viewport: viewport
            };

            page.render(renderContext);
            viewer.appendChild(canvas);
        };

        for (var i = 1; i <= pdf.numPages; i++) {
            pdf.getPage(i).then(handlePages);
        }

    });
```
    
