const PDFGallery = (() => {
  return ({ category }) => {
    const [pdfs, setPdfs] = React.useState([]);
    const [error, setError] = React.useState(null);

    React.useEffect(() => {
      const loadPDFs = async () => {
        try {
          const response = await fetch(`/_data/${category}_pdfs.json`);
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
      React.createElement('h2', { className: 'text-2xl font-bold mb-4 capitalize' }, `${category} PDFs`),
      React.createElement('div', { className: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4' },
        pdfs.map((pdf, index) =>
          React.createElement('div', { key: index, className: 'border p-4 rounded hover:shadow-lg transition-shadow' },
            React.createElement('div', { className: 'flex items-center space-x-4' },
              React.createElement('div', null,
                React.createElement('a', {
                  href: pdf.url,
                  className: 'text-lg font-medium hover:text-blue-500 transition-colors',
                  target: '_blank',
                  rel: 'noopener noreferrer'
                }, pdf.name),
                React.createElement('p', { className: 'text-sm text-gray-500' }, pdf.size)
              )
            )
          )
        )
      )
    );
  };
})();

window.PDFGallery = PDFGallery;