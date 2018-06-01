var flowchart = window.flowchart = cytoscape({
    container: document.getElementById('flowchart'),

    boxSelectionEnabled: false,
    autoungrabify: true,
    autounselectify: true,
    zoomingEnabled: false,
    panningEnabled: false,

    layout: {
      name: 'grid',
      rows: 8,
      padding: 0,
      columns: 2,
      spacingFactor: .75,
      position: function( node ){ return {row:node.data('row'), col:node.data('col')}; }
    },

    style: [
      {
        selector: 'node',
        style: {
          'shape': 'square',
          'content': 'data(name)',
          'text-valign': 'center',
          'text-halign': 'center',
          'background-color': '#0072c1',
          'font-size': '12px',
          'font-family': 'Work Sans, sans-serif',
          'color': '#ecf0f1',
          'width': 'data(width)',
          'height': 'data(height)',
          'text-wrap': 'wrap',
          'text-max-width': '1000px',
          'padding': '8px',
          'overlay-padding': 0,
          'overlay-opacity': 0,
        }
      },
      {
        selector: 'edge',
        style: {
          'curve-style': 'bezier',
          'width': 4,
          'target-arrow-shape': 'triangle',
          'line-color': '#9dbaea',
          'target-arrow-color': '#9dbaea',
          'overlay-opacity': 0,
        }
      },
      {
        selector: 'core',
        style: {
          'active-bg-opacity': 0,
        }
      }
    ],

    elements: {
      nodes: [
        { data: { id: 'n0',
                  name: 'Do you feel shaky on a topic and want\nto brush up on the fundamentals?',
                  href: '',
                  width: '240px',
                  height: '18px',
                  row: '1',
                  col: '0'
                } },
        { data: { id: 'n1',
                  name: 'CS61A Textbook',
                  href: 'http://composingprograms.com/',
                  width: '100px',
                  height: '4px',
                  row: '0',
                  col: '1'
                } },
        { data: { id: 'n2',
                  name: "Sequoia's Notes",
                  href: 'https://sequoia-tree.github.io/#Textbook',
                  width: '100px',
                  height: '4px',
                  row: '1',
                  col: '1'
                } },
        { data: { id: 'n3',
                  name: "TA's Slides in each Topic section",
                  href: '/resources.html#getting-started',
                  width: '190px',
                  height: '4px',
                  row: '2',
                  col: '1'
                } },
        { data: { id: 'n4',
                  name: `Do you feel comfortable with Discussion and Lab questions\nfor a topic, and want more difficult practice?`,
                  href: '',
                  width: '360px',
                  height: '18px',
                  row: '3',
                  col: '0'
                } },
        { data: { id: 'n5',
                  name: "Exam Questions on ____\nin each Topic section",
                  href: '/resources.html#variables--functions',
                  width: '140px',
                  height: '14px',
                  row: '3',
                  col: '1'
                } },
        { data: { id: 'n6',
                  name: "Are you interested in studying for exams in general?",
                  href: '',
                  width: '300px',
                  height: '4px',
                  row: '5',
                  col: '0'
                } },
        { data: { id: 'n7',
                  name: "Studying Guide",
                  href: '/articles/studying.html',
                  width: '80px',
                  height: '4px',
                  row: '4',
                  col: '1'
                } },
        { data: { id: 'n8',
                  name: "Past Exams",
                  href: '/resources.html#past-exams',
                  width: '60px',
                  height: '4px',
                  row: '5',
                  col: '1'
                } },
        { data: { id: 'n9',
                  name: 'Midterm 1, Midterm 2 & Final headers',
                  href: '/resources.html#midterm-1',
                  width: '220px',
                  height: '4px',
                  row: '6',
                  col: '1'
                } },
        { data: { id: 'n10',
                  name: "Are you studying, but feel like you aren't improving?",
                  href: '',
                  width: '310px',
                  height: '5px',
                  row: '7',
                  col: '0'
                } },
        { data: { id: 'n11',
                  name: 'See "Advice" section',
                  href: '/resources.html#advice',
                  width: '120px',
                  height: '4px',
                  row: '7',
                  col: '1'
                } },
      ],
      edges: [
        { data: { source: 'n0', target: 'n1' } },
        { data: { source: 'n0', target: 'n2' } },
        { data: { source: 'n0', target: 'n3' } },
        { data: { source: 'n4', target: 'n5' } },
        { data: { source: 'n6', target: 'n7' } },
        { data: { source: 'n6', target: 'n8' } },
        { data: { source: 'n6', target: 'n9' } },
        { data: { source: 'n10', target: 'n11' } },
      ]
    },
  });

flowchart.on('tap', 'node', function(){
  href = this.data('href')
  if (href !== '') {
    try { // your browser may block popups
      window.open( href, href.charAt(0) === '/' ? '_self' : '');
    } catch(e){ // fall back on url change
      href.charAt(0) === '/' ? window.location.replace(href) : window.location.href = this.data('href');
    }
  }
});

flowchart.on('mouseover', 'node', function (evt) {
                        if (this.data('href') !== '') {
                          $('html,body').css('cursor', 'pointer');
                        }
                    } );

flowchart.on('mouseout', 'node', function (evt) {
                        if (this.data('href') !== '') {
                          $('html,body').css('cursor', 'default');
                        }
                    });
