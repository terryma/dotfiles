
    

  

<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <script type="text/javascript">var NREUMQ=[];NREUMQ.push(["mark","firstbyte",new Date().getTime()]);</script>
        <title>autoload/pathogen.vim at master from tpope/vim-pathogen - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />

    <link href="https://a248.e.akamai.net/assets.github.com/3caf378f22640d86d06e445746d14a0fb0742a68/stylesheets/bundle_github.css" media="screen" rel="stylesheet" type="text/css" />
    

    <script type="text/javascript">
      if (typeof console == "undefined" || typeof console.log == "undefined")
        console = { log: function() {} }
    </script>
    <script type="text/javascript" charset="utf-8">
      var GitHub = {
        assetHost: 'https://a248.e.akamai.net/assets.github.com'
      }
      var github_user = null
      
    </script>
    <script src="https://a248.e.akamai.net/assets.github.com/javascripts/jquery/jquery-1.6.1.min.js" type="text/javascript"></script>
    <script src="https://a248.e.akamai.net/assets.github.com/028b735b7be9bb4df802d5efba13d1360dfe7810/javascripts/bundle_github.js" type="text/javascript"></script>


    
    <script type="text/javascript" charset="utf-8">
      GitHub.spy({
        repo: "tpope/vim-pathogen"
      })
    </script>

    
  <link rel='canonical' href='/tpope/vim-pathogen/blob/fcf77f5101f3e589ce006c40ad3a0432735a05cf/autoload/pathogen.vim'>

  <link href="https://github.com/tpope/vim-pathogen/commits/master.atom" rel="alternate" title="Recent Commits to vim-pathogen:master" type="application/atom+xml" />

        <meta name="description" content="vim-pathogen - pathogen.vim: manage your runtimepath" />
    <script type="text/javascript">
      GitHub.nameWithOwner = GitHub.nameWithOwner || "tpope/vim-pathogen";
      GitHub.currentRef = 'master';
      GitHub.commitSHA = "fcf77f5101f3e589ce006c40ad3a0432735a05cf";
      GitHub.currentPath = 'autoload/pathogen.vim';
      GitHub.masterBranch = "master";

      
    </script>
  

        <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-3769691-2']);
      _gaq.push(['_setDomainName', 'none']);
      _gaq.push(['_trackPageview']);
      _gaq.push(['_trackPageLoadTime']);
      (function() {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
      })();
    </script>

    
  </head>

  

  <body class="logged_out page-blob  env-production">
    

    

    

    <div class="subnavd" id="main">
      <div id="header" class="true">
        
          <a class="logo boring" href="https://github.com">
            
            <img alt="github" class="default" height="45" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov5.png" />
            <!--[if (gt IE 8)|!(IE)]><!-->
            <img alt="github" class="hover" height="45" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov5-hover.png" />
            <!--<![endif]-->
          </a>
        
        
        <div class="topsearch">
  
    <ul class="nav logged_out">
      
      <li class="pricing"><a href="/plans">Pricing and Signup</a></li>
      
      <li class="explore"><a href="/explore">Explore GitHub</a></li>
      <li class="features"><a href="/features">Features</a></li>
      
      <li class="blog"><a href="/blog">Blog</a></li>
      
      <li class="login"><a href="/login?return_to=%2Ftpope%2Fvim-pathogen%2Fblob%2Fmaster%2Fautoload%2Fpathogen.vim">Login</a></li>
    </ul>
  
</div>

      </div>

      
      
        
    <div class="site">
      <div class="pagehead repohead vis-public    instapaper_ignore readability-menu">

      

      <div class="title-actions-bar">
        <h1>
          <a href="/tpope">tpope</a> / <strong><a href="/tpope/vim-pathogen">vim-pathogen</a></strong>
          
          
        </h1>

        
    <ul class="actions">
      

      
        <li class="for-owner" style="display:none"><a href="/tpope/vim-pathogen/admin" class="minibutton btn-admin "><span><span class="icon"></span>Admin</span></a></li>
        <li>
          <a href="/tpope/vim-pathogen/toggle_watch" class="minibutton btn-watch " id="watch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', 'e85754da4dd9b6b2538e4cc754ebbd35855cd1fb'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Watch</span></a>
          <a href="/tpope/vim-pathogen/toggle_watch" class="minibutton btn-watch " id="unwatch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', 'e85754da4dd9b6b2538e4cc754ebbd35855cd1fb'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Unwatch</span></a>
        </li>
        
          
            <li class="for-notforked" style="display:none"><a href="/tpope/vim-pathogen/fork" class="minibutton btn-fork " id="fork_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', 'e85754da4dd9b6b2538e4cc754ebbd35855cd1fb'); f.appendChild(s);f.submit();return false;"><span><span class="icon"></span>Fork</span></a></li>
            <li class="for-hasfork" style="display:none"><a href="#" class="minibutton btn-fork " id="your_fork_button"><span><span class="icon"></span>Your Fork</span></a></li>
          

          
        
      
      
      <li class="repostats">
        <ul class="repo-stats">
          <li class="watchers"><a href="/tpope/vim-pathogen/watchers" title="Watchers" class="tooltipped downwards">584</a></li>
          <li class="forks"><a href="/tpope/vim-pathogen/network" title="Forks" class="tooltipped downwards">23</a></li>
        </ul>
      </li>
    </ul>

      </div>

        
  <ul class="tabs">
    <li><a href="/tpope/vim-pathogen" class="selected" highlight="repo_source">Source</a></li>
    <li><a href="/tpope/vim-pathogen/commits/master" highlight="repo_commits">Commits</a></li>
    <li><a href="/tpope/vim-pathogen/network" highlight="repo_network">Network</a></li>
    <li><a href="/tpope/vim-pathogen/pulls" highlight="repo_pulls">Pull Requests (0)</a></li>

    

    
      
      <li><a href="/tpope/vim-pathogen/issues" highlight="issues">Issues (6)</a></li>
    

            
    <li><a href="/tpope/vim-pathogen/graphs" highlight="repo_graphs">Graphs</a></li>

    <li class="contextswitch nochoices">
      <span class="toggle leftwards" >
        <em>Branch:</em>
        <code>master</code>
      </span>
    </li>
  </ul>

  <div style="display:none" id="pl-description"><p><em class="placeholder">click here to add a description</em></p></div>
  <div style="display:none" id="pl-homepage"><p><em class="placeholder">click here to add a homepage</em></p></div>

  <div class="subnav-bar">
  
  <ul>
    <li>
      <a href="/tpope/vim-pathogen/branches" class="dropdown">Switch Branches (1)</a>
      <ul>
        
          
            <li><strong>master &#x2713;</strong></li>
            
      </ul>
    </li>
    <li>
      <a href="#" class="dropdown ">Switch Tags (3)</a>
              <ul>
                      
              <li><a href="/tpope/vim-pathogen/blob/v1.3/autoload/pathogen.vim" data-name="v1.3">v1.3</a></li>
            
                      
              <li><a href="/tpope/vim-pathogen/blob/v1.2/autoload/pathogen.vim" data-name="v1.2">v1.2</a></li>
            
                      
              <li><a href="/tpope/vim-pathogen/blob/v1.1/autoload/pathogen.vim" data-name="v1.1">v1.1</a></li>
            
                  </ul>
      
    </li>
    <li>
    
    <a href="/tpope/vim-pathogen/branches" class="manage">Branch List</a>
    
    </li>
  </ul>
</div>

  
  
  
  
  
  



        
    <div id="repo_details" class="metabox clearfix">
      <div id="repo_details_loader" class="metabox-loader" style="display:none">Sending Request&hellip;</div>

        <a href="/tpope/vim-pathogen/downloads" class="download-source" id="download_button" title="Download source, tagged packages and binaries."><span class="icon"></span>Downloads</a>

      <div id="repository_desc_wrapper">
      <div id="repository_description" rel="repository_description_edit">
        
          <p>pathogen.vim: manage your runtimepath
            <span id="read_more" style="display:none">&mdash; <a href="#readme">Read more</a></span>
          </p>
        
      </div>

      <div id="repository_description_edit" style="display:none;" class="inline-edit">
        <form action="/tpope/vim-pathogen/admin/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="e85754da4dd9b6b2538e4cc754ebbd35855cd1fb" /></div>
          <input type="hidden" name="field" value="repository_description">
          <input type="text" class="textfield" name="value" value="pathogen.vim: manage your runtimepath">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      
      <div class="repository-homepage" id="repository_homepage" rel="repository_homepage_edit">
        <p><a href="http://www.vim.org/scripts/script.php?script_id=2332" rel="nofollow">http://www.vim.org/scripts/script.php?script_id=2332</a></p>
      </div>

      <div id="repository_homepage_edit" style="display:none;" class="inline-edit">
        <form action="/tpope/vim-pathogen/admin/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="e85754da4dd9b6b2538e4cc754ebbd35855cd1fb" /></div>
          <input type="hidden" name="field" value="repository_homepage">
          <input type="text" class="textfield" name="value" value="http://www.vim.org/scripts/script.php?script_id=2332">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>
      </div>
      <div class="rule "></div>
      <div id="url_box" class="url-box">
  

  <ul class="clone-urls">
    
      
      <li id="http_clone_url"><a href="https://github.com/tpope/vim-pathogen.git" data-permissions="Read-Only">HTTP</a></li>
      <li id="public_clone_url"><a href="git://github.com/tpope/vim-pathogen.git" data-permissions="Read-Only">Git Read-Only</a></li>
    
    
  </ul>
  <input type="text" spellcheck="false" id="url_field" class="url-field" />
        <span style="display:none" id="url_box_clippy"></span>
      <span id="clippy_tooltip_url_box_clippy" class="clippy-tooltip tooltipped" title="copy to clipboard">
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="14"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="https://a248.e.akamai.net/assets.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=url_box_clippy&amp;copied=&amp;copyto=">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="https://a248.e.akamai.net/assets.github.com/flash/clippy.swf?v5"
             width="14"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=url_box_clippy&amp;copied=&amp;copyto="
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      </span>

  <p id="url_description"><strong>Read+Write</strong> access</p>
</div>

    </div>

    <div class="frame frame-center tree-finder" style="display:none">
      <div class="breadcrumb">
        <b><a href="/tpope/vim-pathogen">vim-pathogen</a></b> /
        <input class="tree-finder-input" type="text" name="query" autocomplete="off" spellcheck="false">
      </div>

      
        <div class="octotip">
          <p>
            <a href="/tpope/vim-pathogen/dismiss-tree-finder-help" class="dismiss js-dismiss-tree-list-help" title="Hide this notice forever">Dismiss</a>
            <strong>Octotip:</strong> You've activated the <em>file finder</em> by pressing <span class="kbd">t</span>
            Start typing to filter the file list. Use <span class="kbd badmono">↑</span> and <span class="kbd badmono">↓</span> to navigate,
            <span class="kbd">enter</span> to view files.
          </p>
        </div>
      

      <table class="tree-browser" cellpadding="0" cellspacing="0">
        <tr class="js-header"><th>&nbsp;</th><th>name</th></tr>
        <tr class="js-no-results no-results" style="display: none">
          <th colspan="2">No matching files</th>
        </tr>
        <tbody class="js-results-list">
        </tbody>
      </table>
    </div>

    <div id="jump-to-line" style="display:none">
      <h2>Jump to Line</h2>
      <form>
        <input class="textfield" type="text">
        <div class="full-button">
          <button type="submit" class="classy">
            <span>Go</span>
          </button>
        </div>
      </form>
    </div>


        

      </div><!-- /.pagehead -->

      

  







<script type="text/javascript">
  GitHub.downloadRepo = '/tpope/vim-pathogen/archives/master'
  GitHub.revType = "master"

  GitHub.repoName = "vim-pathogen"
  GitHub.controllerName = "blob"
  GitHub.actionName     = "show"
  GitHub.currentAction  = "blob#show"

  
    GitHub.loggedIn = false
  

  
</script>




<div class="flash-messages"></div>


  <div id="commit">
    <div class="group">
        
  <div class="envelope commit">
    <div class="human">
      
        <div class="message"><pre><a href="/tpope/vim-pathogen/commit/fcf77f5101f3e589ce006c40ad3a0432735a05cf">Add option to call infect on non-standard paths</a> </pre></div>
      

      <div class="actor">
        <div class="gravatar">
          
          <img src="https://secure.gravatar.com/avatar/03741dc38754e0e7c8799a7e9afd905c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
        </div>
        <div class="name"><a href="/lparry">lparry</a> <span>(author)</span></div>
        <div class="date">
          <time class="js-relative-date" datetime="2011-06-12T00:11:26-07:00" title="2011-06-12 00:11:26">June 12, 2011</time>
        </div>
      </div>

      
        <div class="actor">
          <div class="gravatar">
            <img src="https://secure.gravatar.com/avatar/67259dd09c53aef920fe2aca18c7a8e0?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
          </div>
          <div class="name"><a href="/tpope">tpope</a> <span>(committer)</span></div>
          <div class="date"><time class="js-relative-date" datetime="2011-06-13T20:05:31-07:00" title="2011-06-13 20:05:31">June 13, 2011</time></div>
        </div>
      

    </div>
    <div class="machine">
      <span>c</span>ommit&nbsp;&nbsp;<a href="/tpope/vim-pathogen/commit/fcf77f5101f3e589ce006c40ad3a0432735a05cf" hotkey="c">fcf77f5101f3e589ce00</a><br />
      <span>t</span>ree&nbsp;&nbsp;&nbsp;&nbsp;<a href="/tpope/vim-pathogen/tree/fcf77f5101f3e589ce006c40ad3a0432735a05cf/autoload/pathogen.vim" hotkey="t">fd923a08b99b3efc12b2</a><br />
      
        <span>p</span>arent&nbsp;
        
        <a href="/tpope/vim-pathogen/commit/50650f253119aac23da3239805293322c48f04e3" hotkey="p">50650f253119aac23da3</a>
      

    </div>
  </div>

    </div>
  </div>



  <div id="slider">

  

    <div class="breadcrumb" data-path="autoload/pathogen.vim/">
      <b><a href="/tpope/vim-pathogen/tree/fcf77f5101f3e589ce006c40ad3a0432735a05cf">vim-pathogen</a></b> / <a href="/tpope/vim-pathogen/tree/fcf77f5101f3e589ce006c40ad3a0432735a05cf/autoload">autoload</a> / pathogen.vim       <span style="display:none" id="clippy_3260">autoload/pathogen.vim</span>
      
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="https://a248.e.akamai.net/assets.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=clippy_3260&amp;copied=copied!&amp;copyto=copy to clipboard">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="https://a248.e.akamai.net/assets.github.com/flash/clippy.swf?v5"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=clippy_3260&amp;copied=copied!&amp;copyto=copy to clipboard"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      

    </div>

    <div class="frames">
      <div class="frame frame-center" data-path="autoload/pathogen.vim/" data-canonical-url="/tpope/vim-pathogen/blob/fcf77f5101f3e589ce006c40ad3a0432735a05cf/autoload/pathogen.vim">
        
          <ul class="big-actions">
            
            <li><a class="file-edit-link minibutton" href="/tpope/vim-pathogen/edit/__current_ref__/autoload/pathogen.vim"><span>Edit this file</span></a></li>
          </ul>
        

        <div id="files">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><img alt="Txt" height="16" src="https://a248.e.akamai.net/assets.github.com/images/icons/txt.png" width="16" /></span>
                <span class="mode" title="File Mode">100644</span>
                
                  <span>164 lines (145 sloc)</span>
                
                <span>5.409 kb</span>
              </div>
              <ul class="actions">
                <li><a href="/tpope/vim-pathogen/raw/master/autoload/pathogen.vim" id="raw-url">raw</a></li>
                
                  <li><a href="/tpope/vim-pathogen/blame/master/autoload/pathogen.vim">blame</a></li>
                
                <li><a href="/tpope/vim-pathogen/commits/master/autoload/pathogen.vim">history</a></li>
              </ul>
            </div>
            
  <div class="data type-viml">
    
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <pre class="line_numbers"><span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>
<span id="L136" rel="#L136">136</span>
<span id="L137" rel="#L137">137</span>
<span id="L138" rel="#L138">138</span>
<span id="L139" rel="#L139">139</span>
<span id="L140" rel="#L140">140</span>
<span id="L141" rel="#L141">141</span>
<span id="L142" rel="#L142">142</span>
<span id="L143" rel="#L143">143</span>
<span id="L144" rel="#L144">144</span>
<span id="L145" rel="#L145">145</span>
<span id="L146" rel="#L146">146</span>
<span id="L147" rel="#L147">147</span>
<span id="L148" rel="#L148">148</span>
<span id="L149" rel="#L149">149</span>
<span id="L150" rel="#L150">150</span>
<span id="L151" rel="#L151">151</span>
<span id="L152" rel="#L152">152</span>
<span id="L153" rel="#L153">153</span>
<span id="L154" rel="#L154">154</span>
<span id="L155" rel="#L155">155</span>
<span id="L156" rel="#L156">156</span>
<span id="L157" rel="#L157">157</span>
<span id="L158" rel="#L158">158</span>
<span id="L159" rel="#L159">159</span>
<span id="L160" rel="#L160">160</span>
<span id="L161" rel="#L161">161</span>
<span id="L162" rel="#L162">162</span>
<span id="L163" rel="#L163">163</span>
<span id="L164" rel="#L164">164</span>
</pre>
          </td>
          <td width="100%">
            
              
                <div class="highlight"><pre><div class='line' id='LC1'><span class="c">&quot; pathogen.vim - path option manipulation</span></div><div class='line' id='LC2'><span class="c">&quot; Maintainer:   Tim Pope &lt;vimNOSPAM@tpope.org&gt;</span></div><div class='line' id='LC3'><span class="c">&quot; Version:      1.3</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'><span class="c">&quot; Install in ~/.vim/autoload (or ~\vimfiles\autoload).</span></div><div class='line' id='LC6'><span class="c">&quot;</span></div><div class='line' id='LC7'><span class="c">&quot; For management of individually installed plugins in ~/.vim/bundle</span></div><div class='line' id='LC8'><span class="c">&quot; (or $HOME/vimfiles/bundle), adding &#39;call pathogen#infect()&#39; to your</span></div><div class='line' id='LC9'><span class="c">&quot; .vimrc prior to &#39;fileype plugin indent on&#39; is the only other setup necessary.</span></div><div class='line' id='LC10'><span class="c">&quot;</span></div><div class='line' id='LC11'><span class="c">&quot; API is documented below.</span></div><div class='line' id='LC12'><br/></div><div class='line' id='LC13'><span class="k">if</span> exists<span class="p">(</span><span class="s2">&quot;g:loaded_pathogen&quot;</span><span class="p">)</span> <span class="p">||</span> &amp;<span class="k">cp</span></div><div class='line' id='LC14'>&nbsp;&nbsp;<span class="k">finish</span></div><div class='line' id='LC15'><span class="k">endif</span></div><div class='line' id='LC16'><span class="k">let</span> g:loaded_pathogen <span class="p">=</span> <span class="m">1</span></div><div class='line' id='LC17'><br/></div><div class='line' id='LC18'><span class="c">&quot; Point of entry for basic default usage.</span></div><div class='line' id='LC19'><span class="k">function</span><span class="p">!</span> pathogen#infect<span class="p">(</span>...<span class="p">)</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC20'>&nbsp;&nbsp;<span class="k">let</span> source_path <span class="p">=</span> a:<span class="m">0</span> ? a:<span class="m">1</span> : <span class="s1">&#39;bundle&#39;</span></div><div class='line' id='LC21'>&nbsp;&nbsp;<span class="k">call</span> pathogen#runtime_append_all_bundles<span class="p">(</span>source_path<span class="p">)</span></div><div class='line' id='LC22'>&nbsp;&nbsp;<span class="k">call</span> pathogen#cycle_filetype<span class="p">()</span></div><div class='line' id='LC23'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC24'><br/></div><div class='line' id='LC25'><span class="c">&quot; Split a path into a list.</span></div><div class='line' id='LC26'><span class="k">function</span><span class="p">!</span> pathogen#split<span class="p">(</span><span class="nb">path</span><span class="p">)</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC27'>&nbsp;&nbsp;<span class="k">if</span> type<span class="p">(</span>a:<span class="nb">path</span><span class="p">)</span> <span class="p">==</span> type<span class="p">(</span>[]<span class="p">)</span> <span class="p">|</span> <span class="k">return</span> a:<span class="nb">path</span> <span class="p">|</span> <span class="k">endif</span></div><div class='line' id='LC28'>&nbsp;&nbsp;<span class="k">let</span> split <span class="p">=</span> split<span class="p">(</span>a:<span class="nb">path</span><span class="p">,</span><span class="s1">&#39;\\\@&lt;!\%(\\\\\)*\zs,&#39;</span><span class="p">)</span></div><div class='line' id='LC29'>&nbsp;&nbsp;<span class="k">return</span> map<span class="p">(</span>split<span class="p">,</span><span class="s1">&#39;substitute(v:val,&#39;&#39;\\\([\\,]\)&#39;&#39;,&#39;&#39;\1&#39;&#39;,&quot;g&quot;)&#39;</span><span class="p">)</span></div><div class='line' id='LC30'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC31'><br/></div><div class='line' id='LC32'><span class="c">&quot; Convert a list to a path.</span></div><div class='line' id='LC33'><span class="k">function</span><span class="p">!</span> pathogen#<span class="k">join</span><span class="p">(</span>...<span class="p">)</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC34'>&nbsp;&nbsp;<span class="k">if</span> type<span class="p">(</span>a:<span class="m">1</span><span class="p">)</span> <span class="p">==</span> type<span class="p">(</span><span class="m">1</span><span class="p">)</span> &amp;&amp; a:<span class="m">1</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">=</span> <span class="m">1</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> space <span class="p">=</span> <span class="s1">&#39; &#39;</span></div><div class='line' id='LC37'>&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">=</span> <span class="m">0</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> space <span class="p">=</span> <span class="s1">&#39;&#39;</span></div><div class='line' id='LC40'>&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC41'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> <span class="p">=</span> <span class="c">&quot;&quot;</span></div><div class='line' id='LC42'>&nbsp;&nbsp;<span class="k">while</span> i <span class="p">&lt;</span> a:<span class="m">0</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> type<span class="p">(</span>a:<span class="m">000</span>[i]<span class="p">)</span> <span class="p">==</span> type<span class="p">(</span>[]<span class="p">)</span></div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">=</span> a:<span class="m">000</span>[i]</div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="k">j</span> <span class="p">=</span> <span class="m">0</span></div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">while</span> <span class="k">j</span> <span class="p">&lt;</span> len<span class="p">(</span><span class="nb">list</span><span class="p">)</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> escaped <span class="p">=</span> substitute<span class="p">(</span><span class="nb">list</span>[<span class="k">j</span>]<span class="p">,</span><span class="s1">&#39;[,&#39;</span>.space.<span class="s1">&#39;]\|\\[\,&#39;</span>.space.<span class="s1">&#39;]\@=&#39;</span><span class="p">,</span><span class="s1">&#39;\\&amp;&#39;</span><span class="p">,</span><span class="s1">&#39;g&#39;</span><span class="p">)</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> .<span class="p">=</span> <span class="s1">&#39;,&#39;</span> . escaped</div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="k">j</span> <span class="p">+=</span> <span class="m">1</span></div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endwhile</span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> .<span class="p">=</span> <span class="c">&quot;,&quot; . a:000[i]</span></div><div class='line' id='LC53'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC54'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">+=</span> <span class="m">1</span></div><div class='line' id='LC55'>&nbsp;&nbsp;<span class="k">endwhile</span></div><div class='line' id='LC56'>&nbsp;&nbsp;<span class="k">return</span> substitute<span class="p">(</span><span class="nb">path</span><span class="p">,</span><span class="s1">&#39;^,&#39;</span><span class="p">,</span><span class="s1">&#39;&#39;</span><span class="p">,</span><span class="s1">&#39;&#39;</span><span class="p">)</span></div><div class='line' id='LC57'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC58'><br/></div><div class='line' id='LC59'><span class="c">&quot; Convert a list to a path with escaped spaces for &#39;path&#39;, &#39;tag&#39;, etc.</span></div><div class='line' id='LC60'><span class="k">function</span><span class="p">!</span> pathogen#legacyjoin<span class="p">(</span>...<span class="p">)</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC61'>&nbsp;&nbsp;<span class="k">return</span> <span class="k">call</span><span class="p">(</span><span class="s1">&#39;pathogen#join&#39;</span><span class="p">,</span>[<span class="m">1</span>] <span class="p">+</span> a:<span class="m">000</span><span class="p">)</span></div><div class='line' id='LC62'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC63'><br/></div><div class='line' id='LC64'><span class="c">&quot; Remove duplicates from a list.</span></div><div class='line' id='LC65'><span class="k">function</span><span class="p">!</span> pathogen#uniq<span class="p">(</span><span class="nb">list</span><span class="p">)</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC66'>&nbsp;&nbsp;<span class="k">let</span> i <span class="p">=</span> <span class="m">0</span></div><div class='line' id='LC67'>&nbsp;&nbsp;<span class="k">let</span> seen <span class="p">=</span> {}</div><div class='line' id='LC68'>&nbsp;&nbsp;<span class="k">while</span> i <span class="p">&lt;</span> len<span class="p">(</span>a:<span class="nb">list</span><span class="p">)</span></div><div class='line' id='LC69'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> has_key<span class="p">(</span>seen<span class="p">,</span>a:<span class="nb">list</span>[i]<span class="p">)</span></div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">call</span> remove<span class="p">(</span>a:<span class="nb">list</span><span class="p">,</span>i<span class="p">)</span></div><div class='line' id='LC71'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC72'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> seen[a:<span class="nb">list</span>[i]] <span class="p">=</span> <span class="m">1</span></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">+=</span> <span class="m">1</span></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC75'>&nbsp;&nbsp;<span class="k">endwhile</span></div><div class='line' id='LC76'>&nbsp;&nbsp;<span class="k">return</span> a:<span class="nb">list</span></div><div class='line' id='LC77'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC78'><br/></div><div class='line' id='LC79'><span class="c">&quot; \ on Windows unless shellslash is set, / everywhere else.</span></div><div class='line' id='LC80'><span class="k">function</span><span class="p">!</span> pathogen#separator<span class="p">()</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC81'>&nbsp;&nbsp;<span class="k">return</span> <span class="p">!</span>exists<span class="p">(</span><span class="s2">&quot;+shellslash&quot;</span><span class="p">)</span> <span class="p">||</span> &amp;<span class="nb">shellslash</span> ? <span class="s1">&#39;/&#39;</span> : <span class="s1">&#39;\&#39;</span></div><div class='line' id='LC82'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC83'><br/></div><div class='line' id='LC84'><span class="c">&quot; Convenience wrapper around glob() which returns a list.</span></div><div class='line' id='LC85'><span class="k">function</span><span class="p">!</span> pathogen#glob<span class="p">(</span>pattern<span class="p">)</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC86'>&nbsp;&nbsp;<span class="k">let</span> <span class="k">files</span> <span class="p">=</span> split<span class="p">(</span>glob<span class="p">(</span>a:pattern<span class="p">),</span><span class="s2">&quot;\n&quot;</span><span class="p">)</span></div><div class='line' id='LC87'>&nbsp;&nbsp;<span class="k">return</span> map<span class="p">(</span><span class="k">files</span><span class="p">,</span><span class="s1">&#39;substitute(v:val,&quot;[&quot;.pathogen#separator().&quot;/]$&quot;,&quot;&quot;,&quot;&quot;)&#39;</span><span class="p">)</span></div><div class='line' id='LC88'><span class="k">endfunction</span> <span class="c">&quot;}}}1</span></div><div class='line' id='LC89'><br/></div><div class='line' id='LC90'><span class="c">&quot; Like pathogen#glob(), only limit the results to directories.</span></div><div class='line' id='LC91'><span class="k">function</span><span class="p">!</span> pathogen#glob_directories<span class="p">(</span>pattern<span class="p">)</span> abort <span class="c">&quot; {{{1</span></div><div class='line' id='LC92'>&nbsp;&nbsp;<span class="k">return</span> filter<span class="p">(</span>pathogen#glob<span class="p">(</span>a:pattern<span class="p">),</span><span class="s1">&#39;isdirectory(v:val)&#39;</span><span class="p">)</span></div><div class='line' id='LC93'><span class="k">endfunction</span> <span class="c">&quot;}}}1</span></div><div class='line' id='LC94'><br/></div><div class='line' id='LC95'><span class="c">&quot; Turn filetype detection off and back on again if it was already enabled.</span></div><div class='line' id='LC96'><span class="k">function</span><span class="p">!</span> pathogen#cycle_filetype<span class="p">()</span> <span class="c">&quot; {{{1</span></div><div class='line' id='LC97'>&nbsp;&nbsp;<span class="k">if</span> exists<span class="p">(</span><span class="s1">&#39;g:did_load_filetypes&#39;</span><span class="p">)</span></div><div class='line' id='LC98'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">filetype</span> off</div><div class='line' id='LC99'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">filetype</span> <span class="k">on</span></div><div class='line' id='LC100'>&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC101'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC102'><br/></div><div class='line' id='LC103'><span class="c">&quot; Checks if a bundle is &#39;disabled&#39;. A bundle is considered &#39;disabled&#39; if</span></div><div class='line' id='LC104'><span class="c">&quot; its &#39;basename()&#39; is included in g:pathogen_disabled[]&#39;.</span></div><div class='line' id='LC105'><span class="k">function</span><span class="p">!</span> pathogen#is_disabled<span class="p">(</span><span class="nb">path</span><span class="p">)</span> <span class="c">&quot; {{{1</span></div><div class='line' id='LC106'>&nbsp;&nbsp;<span class="k">if</span> <span class="p">!</span>exists<span class="p">(</span><span class="s2">&quot;g:pathogen_disabled&quot;</span><span class="p">)</span></div><div class='line' id='LC107'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="m">0</span></div><div class='line' id='LC108'>&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC109'>&nbsp;&nbsp;<span class="k">let</span> sep <span class="p">=</span> pathogen#separator<span class="p">()</span></div><div class='line' id='LC110'>&nbsp;&nbsp;<span class="k">return</span> index<span class="p">(</span>g:pathogen_disabled<span class="p">,</span> strpart<span class="p">(</span>a:<span class="nb">path</span><span class="p">,</span> strridx<span class="p">(</span>a:<span class="nb">path</span><span class="p">,</span> sep<span class="p">)+</span><span class="m">1</span><span class="p">))</span> <span class="p">!=</span> <span class="m">-1</span></div><div class='line' id='LC111'><span class="k">endfunction</span> <span class="c">&quot;}}}1</span></div><div class='line' id='LC112'><br/></div><div class='line' id='LC113'><span class="c">&quot; Prepend all subdirectories of path to the rtp, and append all &#39;after&#39;</span></div><div class='line' id='LC114'><span class="c">&quot; directories in those subdirectories.</span></div><div class='line' id='LC115'><span class="k">function</span><span class="p">!</span> pathogen#runtime_prepend_subdirectories<span class="p">(</span><span class="nb">path</span><span class="p">)</span> <span class="c">&quot; {{{1</span></div><div class='line' id='LC116'>&nbsp;&nbsp;<span class="k">let</span> sep    <span class="p">=</span> pathogen#separator<span class="p">()</span></div><div class='line' id='LC117'>&nbsp;&nbsp;<span class="k">let</span> before <span class="p">=</span> filter<span class="p">(</span>pathogen#glob_directories<span class="p">(</span>a:<span class="nb">path</span>.sep.<span class="s2">&quot;*[^~]&quot;</span><span class="p">),</span> <span class="s1">&#39;!pathogen#is_disabled(v:val)&#39;</span><span class="p">)</span></div><div class='line' id='LC118'>&nbsp;&nbsp;<span class="k">let</span> after  <span class="p">=</span> filter<span class="p">(</span>pathogen#glob_directories<span class="p">(</span>a:<span class="nb">path</span>.sep.<span class="s2">&quot;*[^~]&quot;</span>.sep.<span class="s2">&quot;after&quot;</span><span class="p">),</span> <span class="s1">&#39;!pathogen#is_disabled(v:val[0:-7])&#39;</span><span class="p">)</span></div><div class='line' id='LC119'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">rtp</span> <span class="p">=</span> pathogen#split<span class="p">(</span>&amp;<span class="nb">rtp</span><span class="p">)</span></div><div class='line' id='LC120'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> <span class="p">=</span> expand<span class="p">(</span>a:<span class="nb">path</span><span class="p">)</span></div><div class='line' id='LC121'>&nbsp;&nbsp;<span class="k">call</span> filter<span class="p">(</span><span class="nb">rtp</span><span class="p">,</span><span class="s1">&#39;v:val[0:strlen(path)-1] !=# path&#39;</span><span class="p">)</span></div><div class='line' id='LC122'>&nbsp;&nbsp;<span class="k">let</span> &amp;<span class="nb">rtp</span> <span class="p">=</span> pathogen#<span class="k">join</span><span class="p">(</span>pathogen#uniq<span class="p">(</span>before <span class="p">+</span> <span class="nb">rtp</span> <span class="p">+</span> after<span class="p">))</span></div><div class='line' id='LC123'>&nbsp;&nbsp;<span class="k">return</span> &amp;<span class="nb">rtp</span></div><div class='line' id='LC124'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC125'><br/></div><div class='line' id='LC126'><span class="c">&quot; For each directory in rtp, check for a subdirectory named dir.  If it</span></div><div class='line' id='LC127'><span class="c">&quot; exists, add all subdirectories of that subdirectory to the rtp, immediately</span></div><div class='line' id='LC128'><span class="c">&quot; after the original directory.  If no argument is given, &#39;bundle&#39; is used.</span></div><div class='line' id='LC129'><span class="c">&quot; Repeated calls with the same arguments are ignored.</span></div><div class='line' id='LC130'><span class="k">function</span><span class="p">!</span> pathogen#runtime_append_all_bundles<span class="p">(</span>...<span class="p">)</span> <span class="c">&quot; {{{1</span></div><div class='line' id='LC131'>&nbsp;&nbsp;<span class="k">let</span> sep <span class="p">=</span> pathogen#separator<span class="p">()</span></div><div class='line' id='LC132'>&nbsp;&nbsp;<span class="k">let</span> name <span class="p">=</span> a:<span class="m">0</span> ? a:<span class="m">1</span> : <span class="s1">&#39;bundle&#39;</span></div><div class='line' id='LC133'>&nbsp;&nbsp;<span class="k">if</span> <span class="c">&quot;\n&quot;.s:done_bundles =~# &quot;\\M\n&quot;.name.&quot;\n&quot;</span></div><div class='line' id='LC134'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="c">&quot;&quot;</span></div><div class='line' id='LC135'>&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC136'>&nbsp;&nbsp;<span class="k">let</span> s:done_bundles .<span class="p">=</span> name . <span class="c">&quot;\n&quot;</span></div><div class='line' id='LC137'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">=</span> []</div><div class='line' id='LC138'>&nbsp;&nbsp;<span class="k">for</span> <span class="nb">dir</span> <span class="k">in</span> pathogen#split<span class="p">(</span>&amp;<span class="nb">rtp</span><span class="p">)</span></div><div class='line' id='LC139'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="nb">dir</span> <span class="p">=~</span># <span class="s1">&#39;\&lt;after$&#39;</span></div><div class='line' id='LC140'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">+=</span>  filter<span class="p">(</span>pathogen#glob_directories<span class="p">(</span>substitute<span class="p">(</span><span class="nb">dir</span><span class="p">,</span><span class="s1">&#39;after$&#39;</span><span class="p">,</span>name<span class="p">,</span><span class="s1">&#39;&#39;</span><span class="p">)</span>.sep.<span class="s1">&#39;*[^~]&#39;</span>.sep.<span class="s1">&#39;after&#39;</span><span class="p">),</span> <span class="s1">&#39;!pathogen#is_disabled(v:val[0:-7])&#39;</span><span class="p">)</span> <span class="p">+</span> [<span class="nb">dir</span>]</div><div class='line' id='LC141'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC142'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">+=</span>  [<span class="nb">dir</span>] <span class="p">+</span> filter<span class="p">(</span>pathogen#glob_directories<span class="p">(</span><span class="nb">dir</span>.sep.name.sep.<span class="s1">&#39;*[^~]&#39;</span><span class="p">),</span> <span class="s1">&#39;!pathogen#is_disabled(v:val)&#39;</span><span class="p">)</span></div><div class='line' id='LC143'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC144'>&nbsp;&nbsp;<span class="k">endfor</span></div><div class='line' id='LC145'>&nbsp;&nbsp;<span class="k">let</span> &amp;<span class="nb">rtp</span> <span class="p">=</span> pathogen#<span class="k">join</span><span class="p">(</span>pathogen#uniq<span class="p">(</span><span class="nb">list</span><span class="p">))</span></div><div class='line' id='LC146'>&nbsp;&nbsp;<span class="k">return</span> <span class="m">1</span></div><div class='line' id='LC147'><span class="k">endfunction</span></div><div class='line' id='LC148'><br/></div><div class='line' id='LC149'><span class="k">let</span> s:done_bundles <span class="p">=</span> <span class="s1">&#39;&#39;</span></div><div class='line' id='LC150'><span class="c">&quot; }}}1</span></div><div class='line' id='LC151'><br/></div><div class='line' id='LC152'><span class="c">&quot; Invoke :helptags on all non-$VIM doc directories in runtimepath.</span></div><div class='line' id='LC153'><span class="k">function</span><span class="p">!</span> pathogen#<span class="k">helptags</span><span class="p">()</span> <span class="c">&quot; {{{1</span></div><div class='line' id='LC154'>&nbsp;&nbsp;<span class="k">for</span> <span class="nb">dir</span> <span class="k">in</span> pathogen#split<span class="p">(</span>&amp;<span class="nb">rtp</span><span class="p">)</span></div><div class='line' id='LC155'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="nb">dir</span>[<span class="m">0</span> : strlen<span class="p">(</span>$VIMRUNTIME<span class="p">)</span><span class="m">-1</span>] <span class="p">!=</span># $VIMRUNTIME &amp;&amp; filewritable<span class="p">(</span><span class="nb">dir</span>.<span class="s1">&#39;/doc&#39;</span><span class="p">)</span> <span class="p">==</span> <span class="m">2</span> &amp;&amp; <span class="p">!</span>empty<span class="p">(</span>glob<span class="p">(</span><span class="nb">dir</span>.<span class="s1">&#39;/doc/*&#39;</span><span class="p">))</span> &amp;&amp; <span class="p">(!</span>filereadable<span class="p">(</span><span class="nb">dir</span>.<span class="s1">&#39;/doc/tags&#39;</span><span class="p">)</span> <span class="p">||</span> filewritable<span class="p">(</span><span class="nb">dir</span>.<span class="s1">&#39;/doc/tags&#39;</span><span class="p">))</span></div><div class='line' id='LC156'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">helptags</span> `<span class="p">=</span><span class="nb">dir</span>.<span class="s1">&#39;/doc&#39;</span>`</div><div class='line' id='LC157'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC158'>&nbsp;&nbsp;<span class="k">endfor</span></div><div class='line' id='LC159'><span class="k">endfunction</span> <span class="c">&quot; }}}1</span></div><div class='line' id='LC160'><br/></div><div class='line' id='LC161'>command<span class="p">!</span> <span class="p">-</span><span class="nb">bar</span> Helptags :<span class="k">call</span> pathogen#<span class="k">helptags</span><span class="p">()</span></div><div class='line' id='LC162'><br/></div><div class='line' id='LC163'><span class="c">&quot; vim:set ft=vim ts=8 sw=2 sts=2:</span></div><div class='line' id='LC164'><br/></div></pre></div>
              
            
          </td>
        </tr>
      </table>
    
  </div>


          </div>
        </div>
      </div>
    </div>
  

  </div>


<div class="frame frame-loading" style="display:none;">
  <img src="https://a248.e.akamai.net/assets.github.com/images/modules/ajax/big_spinner_336699.gif" height="32" width="32">
</div>

    </div>
  
      
    </div>

    <div id="footer" class="clearfix">
      <div class="site">
        
          <div class="sponsor">
            <a href="http://www.rackspace.com" class="logo">
              <img alt="Dedicated Server" height="36" src="https://a248.e.akamai.net/assets.github.com/images/modules/footer/rackspace_logo.png?v2" width="38" />
            </a>
            Powered by the <a href="http://www.rackspace.com ">Dedicated
            Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
            Computing</a> of Rackspace Hosting<span>&reg;</span>
          </div>
        

        <ul class="links">
          
            <li class="blog"><a href="https://github.com/blog">Blog</a></li>
            <li><a href="https://github.com/about">About</a></li>
            <li><a href="https://github.com/contact">Contact &amp; Support</a></li>
            <li><a href="https://github.com/training">Training</a></li>
            <li><a href="http://jobs.github.com">Job Board</a></li>
            <li><a href="http://shop.github.com">Shop</a></li>
            <li><a href="http://developer.github.com">API</a></li>
            <li><a href="http://status.github.com">Status</a></li>
          
        </ul>
        <ul class="sosueme">
          <li class="main">&copy; 2011 <span id="_rrt" title="0.04809s from fe2.rs.github.com">GitHub</span> Inc. All rights reserved.</li>
          <li><a href="/site/terms">Terms of Service</a></li>
          <li><a href="/site/privacy">Privacy</a></li>
          <li><a href="https://github.com/security">Security</a></li>
        </ul>
      </div>
    </div><!-- /#footer -->

    <script>window._auth_token = "e85754da4dd9b6b2538e4cc754ebbd35855cd1fb"</script>
    

<div id="keyboard_shortcuts_pane" class="instapaper_ignore readability-extra" style="display:none">
  <h2>Keyboard Shortcuts <small><a href="#" class="js-see-all-keyboard-shortcuts">(see all)</a></small></h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus site search</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column middle" style='display:none'>
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>t</dt>
        <dd>Open tree</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>p</dt>
        <dd>Open parent</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>y</dt>
        <dd>Expand URL to its canonical form</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column last" style='display:none'>
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
    </div><!-- /.columns.last -->

  </div><!-- /.columns.equacols -->

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selected down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selected up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>x</dt>
          <dd>Toggle select target</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column middle">
        <dl class="keyboard-mappings">
          <dt>I</dt>
          <dd>Mark selected as read</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>U</dt>
          <dd>Mark selected as unread</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>e</dt>
          <dd>Close selected</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Remove selected from view</dd>
        </dl>
      </div><!-- /.column.middle -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>c</dt>
          <dd>Create issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Create label</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>i</dt>
          <dd>Back to inbox</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>u</dt>
          <dd>Back to issues</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>/</dt>
          <dd>Focus issues search</dd>
        </dl>
      </div>
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Network Graph</h3>
    <div class="columns equacols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt><span class="badmono">←</span> <em>or</em> h</dt>
          <dd>Scroll left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">→</span> <em>or</em> l</dt>
          <dd>Scroll right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↑</span> <em>or</em> k</dt>
          <dd>Scroll up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↓</span> <em>or</em> j</dt>
          <dd>Scroll down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Toggle visibility of head labels</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">←</span> <em>or</em> shift h</dt>
          <dd>Scroll all the way left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">→</span> <em>or</em> shift l</dt>
          <dd>Scroll all the way right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↑</span> <em>or</em> shift k</dt>
          <dd>Scroll all the way up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↓</span> <em>or</em> shift j</dt>
          <dd>Scroll all the way down</dd>
        </dl>
      </div><!-- /.column.last -->
    </div>
  </div>

  <div >
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first" >
        <h3>Source Code Browsing</h3>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Activates the file finder</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Jump to line</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Expand URL to its canonical form</dd>
        </dl>
      </div>
    </div>
  </div>
</div>

    <div id="markdown-help" class="instapaper_ignore readability-extra">
  <h2>Markdown Cheat Sheet</h2>

  <div class="cheatsheet-content">

  <div class="mod">
    <div class="col">
      <h3>Format Text</h3>
      <p>Headers</p>
      <pre>
# This is an &lt;h1&gt; tag
## This is an &lt;h2&gt; tag
###### This is an &lt;h6&gt; tag</pre>
     <p>Text styles</p>
     <pre>
*This text will be italic*
_This will also be italic_
**This text will be bold**
__This will also be bold__

*You **can** combine them*
</pre>
    </div>
    <div class="col">
      <h3>Lists</h3>
      <p>Unordered</p>
      <pre>
* Item 1
* Item 2
  * Item 2a
  * Item 2b</pre>
     <p>Ordered</p>
     <pre>
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b</pre>
    </div>
    <div class="col">
      <h3>Miscellaneous</h3>
      <p>Images</p>
      <pre>
![GitHub Logo](/images/logo.png)
Format: ![Alt Text](url)
</pre>
     <p>Links</p>
     <pre>
http://github.com - automatic!
[GitHub](http://github.com)</pre>
<p>Blockquotes</p>
     <pre>
As Kanye West said:
> We're living the future so
> the present is our past.
</pre>
    </div>
  </div>
  <div class="rule"></div>

  <h3>Code Examples in Markdown</h3>
  <div class="col">
      <p>Syntax highlighting with <a href="http://github.github.com/github-flavored-markdown/" title="GitHub Flavored Markdown">GFM</a></p>
      <pre>
```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```</pre>
    </div>
    <div class="col">
      <p>Or, indent your code 4 spaces</p>
      <pre>
Here is a Python code example
without syntax highlighting:

    def foo:
      if not bar:
        return true</pre>
    </div>
    <div class="col">
      <p>Inline code for comments</p>
      <pre>
I think you should use an
`&lt;addr&gt;` element here instead.</pre>
    </div>
  </div>

  </div>
</div>
    

    <!--[if IE 8]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie8")
    </script>
    <![endif]-->

    <!--[if IE 7]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie7")
    </script>
    <![endif]-->

    
    
    
    <script type="text/javascript">(function(){var d=document;var e=d.createElement("script");e.async=true;e.src="https://d1ros97qkrwjf5.cloudfront.net/12/eum/rum.js	";e.type="text/javascript";var s=d.getElementsByTagName("script")[0];s.parentNode.insertBefore(e,s);})();NREUMQ.push(["nrf2","beacon-1.newrelic.com","2f94e4d8c2",64799,"dw1bEBZcX1RWRhoEClsAGhcMXEQ=",0.0,44,new Date().getTime()])</script>
  </body>
</html>

