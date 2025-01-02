---
layout: default
title: Paul Goldsmith-Pinkham
---

<div id="presentations-gallery"></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>
<script type="module">
  pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

  const PDFGallery = (() => {
    const renderThumbnail = async (canvasElement, pdfUrl) => {
      try {
        const loadingTask = pdfjsLib.getDocument(pdfUrl);
        const pdfDoc = await loadingTask.promise;
        const page = await pdfDoc.getPage(1);
        const viewport = page.getViewport({ scale: 1 });
        
        canvasElement.width = 600;
        canvasElement.height = 300;
        const context = canvasElement.getContext('2d');
        
        await page.render({
          canvasContext: context,
          viewport: viewport
        }).promise;
      } catch (error) {
        console.error('Error rendering thumbnail:', error);
      }
    };

    return ({ category }) => {
      const [pdfs, setPdfs] = React.useState([]);
      const [error, setError] = React.useState(null);

      React.useEffect(() => {
        const loadPDFs = async () => {
          try {
            const response = await fetch(`/assets/data/${category}_pdfs.json`);
            const data = await response.json();
            setPdfs(data.pdfs);
          } catch (error) {
            setError(`Error loading ${category} PDFs`);
            console.error('Error:', error);
          }
        };
        loadPDFs();
      }, [category]);

      if (error) return React.createElement('div', { className: 'text-red-500' }, error);

      return React.createElement('div', { className: 'p-4' },
        React.createElement('h2', { className: 'text-2xl font-bold mb-4 capitalize' }, `Presentations List`),
        React.createElement('ul', { className: 'space-y-4' },
          pdfs.map((pdf, index) => 
            React.createElement('li', { 
 key: index,
 className: 'flex flex-col space-y-2' 
},
 React.createElement('a', {
  href: pdf.url,
  className: 'hover:text-blue-500 transition-colors',
  target: '_blank',
  rel: 'noopener noreferrer'
}, 
pdf.name + ' (' + pdf.size + ') - Created: ' + new Date(pdf.modified).toISOString().split('T')[0]
),
 React.createElement('br'),
 React.createElement('canvas', {
   ref: (canvas) => {
     if (canvas) {
       renderThumbnail(canvas, pdf.url);
     }
   },
   className: 'border'
 })
)
        )
        )
      );
    };
  })();

  ReactDOM.render(
    React.createElement(PDFGallery, { category: 'presentations' }),
    document.getElementById('presentations-gallery')
  );
</script>