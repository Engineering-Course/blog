{% include 'head.swig' %}
<body>
{% include 'side-pagination.swig' %}
<div id="outer-container" class="hide-area">
<div id="container">
  <div id="menu-outer" class="slide-down">
    <div id="menu-inner">
      <div id="brand">
        {# <a href="{{ url_for('/') }}"> #}
        <a onClick="openUserCard()">
          <img id="avatar" src="{{theme.avatar}}"/>
          <div id="homelink">{{config.title}}</div>
        </a>
      </div>
      <div id="menu-list">
        <ul>
        {% set menu = config.menu || theme.menu %}
        {% for key in Object.keys(menu) %}
          {% if is_current(menu[key]) %}
            <li class="active">
          {% else %}
            <li>
          {% endif %}
            <a href="{{ url_for(menu[key]) }}">{{ key }}</a>
            {# <span>{{key}}</span> #}
          </li>
        {% endfor %}
        </ul>
      </div>
      <div id="show-menu">
        <button>Menu</button>
      </div>
    </div>
  </div>

  <div id="content-outer">
    <div id="content-inner">
      {# {% autoescape false %}{{ body }}{% endautoescape %} #}
      {% block body %}{% endblock %}
      {% if page.comments && (theme.duoshuo_shortname || config.duoshuo_shortname) %}
      <div class="ds-thread" data-thread-key="{{ page.path }}" data-title="{{ page.title }}" data-url="{{ page.permalink }}"></div>
      {% endif %}
      {% if page.comments && (config.uyan_id || theme.uyan_id) %}
      <div id="uyan_frame"></div>
      {% endif %}
      {% if page.comments && (config.disqus_shortname || theme.disqus_shortname) %}
      <div id="disqus_thread"></div>
      {% endif %}
    </div>
  </div>


  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js">
  </script>

  <div id="bottom-outer">
    <div id="bottom-inner">
      <div>
      <span id="busuanzi_container_site_pv" style='display:none'>
          <span id="site-visit" >本站到访数: 
              <span id="busuanzi_value_site_uv"></span>
          </span>
      </span>
      <span id="busuanzi_container_page_pv" style='display:none'>
          <span id="page-visit">, 本页阅读量: 
              <span id="busuanzi_value_page_pv"></span>
          </span>
      </span>
      <br></br>
      </div>
      
      Site by {{ config.author }} using
      <a href="http://hexo.io">Hexo</a> & <a href="https://github.com/stiekel/hexo-theme-random">Random</a>
      <br>
      {% if config.since %}
        &copy;
        {% set thisYear = date(Date.now(), 'YYYY') %}

        {{config.since}}
        {% if thisYear != config.since %}
         - {{ date(Date.now(), 'YYYY') }}
        {% endif %}
      {% endif %}
    </div>
  </div>

</div>

</div>
{% if page.comments && (theme.duoshuo_shortname || config.duoshuo_shortname) %}
  {% include 'duoshuo.swig' %}
{% endif %}
{% if page.comments && (config.disqus_shortname || theme.disqus_shortname) %}
  {% include 'disqus.swig' %}
{% endif %}
{% if page.comments && (config.uyan_id || theme.uyan_id) %}
  {% include 'uyan.swig' %}
{% endif %}
{% include 'footer.swig' %}
