/**
 * Change default icons to marerial icons
 */
function changeToMaterial() {
  var materialIconAssoc = {
    'mce-i-code': '<i class="material-icons">code</i>',
    'mce-i-visualblocks': '<i class="material-icons">dashboard</i>',
    'mce-i-charmap': '<i class="material-icons">grade</i>',
    'mce-i-hr': '<i class="material-icons">remove</i>',
    'mce-i-searchreplace': '<i class="material-icons">find_replace</i>',
    'mce-i-none': '<i class="material-icons">format_color_text</i>',
    'mce-i-bold': '<i class="material-icons">format_bold</i>',
    'mce-i-italic': '<i class="material-icons">format_italic</i>',
    'mce-i-underline': '<i class="material-icons">format_underlined</i>',
    'mce-i-strikethrough': '<i class="material-icons">format_strikethrough</i>',
    'mce-i-blockquote': '<i class="material-icons">format_quote</i>',
    'mce-i-link': '<i class="material-icons">link</i>',
    'mce-i-alignleft': '<i class="material-icons">format_align_left</i>',
    'mce-i-aligncenter': '<i class="material-icons">format_align_center</i>',
    'mce-i-alignright': '<i class="material-icons">format_align_right</i>',
    'mce-i-alignjustify': '<i class="material-icons">format_align_justify</i>',
    'mce-i-bullist': '<i class="material-icons">format_list_bulleted</i>',
    'mce-i-numlist': '<i class="material-icons">format_list_numbered</i>',
    'mce-i-image': '<i class="material-icons">image</i>',
    'mce-i-table': '<i class="material-icons">grid_on</i>',
    'mce-i-media': '<i class="material-icons">video_library</i>',
    'mce-i-browse': '<i class="material-icons">attachment</i>',
    'mce-i-checkbox': '<i class="mce-ico mce-i-checkbox"></i>',
    'mce-i-print': '<i class="material-icons">print</i>',
    'mce-i-superscript': '<i class="material-icons">superscript</i>',
    'mce-i-newdocument': '<i class="material-icons">description</i>',
    'mce-i-subscript': '<i class="material-icons">subscript</i>',
    'mce-i-outdent': '<i class="material-icons">format_indent_decrease</i>',
    'mce-i-indent': '<i class="material-icons">format_indent_increase</i>',
    'mce-i-cut': '<i class="material-icons">content_cut</i>',
    'mce-i-copy': '<i class="material-icons">content_copy</i>',
    'mce-i-paste': '<i class="material-icons">content_paste</i>',
    'mce-i-undo': '<i class="material-icons">undo</i>',
    'mce-i-redo': '<i class="material-icons">redo</i>',
    'mce-i-unlink': '<i class="material-icons">link_off</i>',
    'mce-i-anchor': '<i class="material-icons">anchor</i>',
    'mce-i-emoticons': '<i class="material-icons">insert_emoticon</i>',
    'mce-i-inserttime': '<i class="material-icons">alarm</i>',
    'mce-i-preview': '<i class="material-icons">preview</i>',
    'mce-i-forecolor': '<i class="material-icons">palette</i>',
    'mce-i-backcolor': '<i class="material-icons">format_color_fill</i>',
  };
 
  $.each(materialIconAssoc, function (index, value) {
    $('.' + index).replaceWith(value);
  });
}
 
function tinySetup(config) {
 
  if (typeof tinyMCE === 'undefined') {
    setTimeout(function () {
      tinySetup(config);
    }, 100);
    return;
  }  
  if (!config) {
    config = {};
  }
 
  if (typeof config.editor_selector != 'undefined') {
    config.selector = '.' + config.editor_selector;
  }
 
  var default_config = {
    selector: ".rte",
    browser_spellcheck: true,
    plugins : "visualblocks, preview searchreplace print insertdatetime, hr charmap colorpicker anchor code link image paste pagebreak table contextmenu filemanager table code media autoresize textcolor emoticons importcss",
    toolbar2 : "newdocument,print,|,bold,italic,underline,|,strikethrough,superscript,subscript,|,forecolor,colorpicker,backcolor,|,bullist,numlist,outdent,indent,|,template,fullscreen,cleanup",
    toolbar1 : "styleselect,|,fromatselect,|,fontsizeselect,|,pasteword,", 
    toolbar3 : "code,|,table,|,cut,copy,paste,searchreplace,|,blockquote,|,undo,redo,|,link,unlink,anchor,|,image,emoticons,media,|,inserttime,|,preview ",
    toolbar4 : "visualblocks,|,charmap,|,hr,",
    external_filemanager_path: baseAdminDir + "filemanager/",
    filemanager_title: "File manager",
    external_plugins: {"filemanager": baseAdminDir + "filemanager/plugin.min.js"},
    language: iso_user,
    skin: "prestashop",
    statusbar: false,
    relative_urls: false,
    convert_urls: false,
    entity_encoding: "raw",
    valid_children: "+body[style|script|iframe|section],pre[iframe|section|script|div|p|br|span|img|style|h1|h2|h3|h4|h5],*[*]",
    valid_elements : '*[*]', 
    force_p_newlines : false, 
    cleanup: false,
    forced_root_block : false, 
    force_br_newlines : true,  
    convert_urls:true,
    relative_urls:false,
    content_css: '/klido/js/admin/tiny.css',
    extended_valid_elements: "em[class|name|id]",
    remove_script_host:false,
    table_resize_bars: true,
    table_column_resizing: 'resizetable',
    table_class_list: [
      {title: 'None', value: ''},
      {title: 'No Borders', value: 'table_no_borders'},
      {title: 'Red borders', value: 'table_red_borders'},
      {title: 'Blue borders', value: 'table_blue_borders'},
      {title: 'Green borders', value: 'table_green_borders'}
    ],
    importcss_groups: [
      {title: 'Table styles', filter: /^(td|tr|table)\./}, // td.class and tr.class
      {title: 'Block styles', filter: /^(div|p)\./}, // div.class and p.class
      {title: 'Style strony'} // The rest
    ],
    init_instance_callback: "changeToMaterial",
  };

  
  // menu: {
  //   edit: {
  //       title: 'Edit',
  //       items: 'undo redo | cut copy paste | selectall'
  //   },
  //   insert: {
  //       title: 'Insert',
  //       items: 'media image link | pagebreak'
  //   },
  //   view: {
  //       title: 'View',
  //       items: 'visualaid'
  //   },
  //   format: {
  //       title: 'Format',
  //       items: 'bold italic underline strikethrough superscript subscript | formats | removeformat'
  //   },
  //   table: {
  //       title: 'Table',
  //       items: 'inserttable tableprops deletetable | cell row column'
  //   },
  //   tools: {
  //       title: 'Tools',
  //       items: 'code'
  //   }
  // },
  // menubar: 'table',
  // importcss_append: true,
    // content_css: '/klido/themes/classic/assets/css/custom.css?refresh=0112202asd2',
 
  $.each(default_config, function (index, el) {
    if (config[index] === undefined)
      config[index] = el;
  });
 
  // Change icons in popups
  $('body').on('click', '.mce-btn, .mce-open, .mce-menu-item', function () {
    changeToMaterial();
  });
 
  tinyMCE.init(config);
}