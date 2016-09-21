<tansho>

  <h1>tansho</h1>

  <table class="table table-bordered">
    <thead>
      <tr>
        <td>id</td>
	<td>name | <button name="name" onclick={ tansho_asc }>up</button><button name="name" onclick={ tansho_desc }>down</button> </td>
        <td>tan</td>
      </tr>
    </thead>
    <tbody>
      <tr each="{ items1 }">
        <td>{ id || 'nil' }</td>
        <td>{ name || 'nil' }</td>
        <td><button onclick={ start }>{ odds || 'nil' }</button></td>
      </tr>
    </tbody>
  </table>

  <hr/>
  <!--<button type="button" id="store_clear" onclick="alert('data clear and page reload');console.log('clear');store.clear();location.reload()">data clear and page reload</button>-->

  var self = this

  // mount event
  this.on('mount',function(){
      console.log('tansho mounted');
  });
  
  // updated event
  this.opts.obs.on('render_odds_tansho',function(e){
      console.log('tansho data');

      self.items1 = opts.item
      self.update()
  });

  // オッズカート投入
  start(e) {
    this.opts.obs.trigger('start', e.item)
  }
  // 並び替えトリガー
  tansho_asc(e) {
    this.opts.obs.trigger('u_asc', e.target.name)
  }
  // 並び替えトリガー
  tansho_desc(e) {
    this.opts.obs.trigger('u_desc', e.target.name)
  }
  // 並び替え呼び出し
  this.opts.obs.on('u_asc', function (col) {
    self.items1.sort(function(a,b){
        if(a[col] < b[col]) return -1;
        if(a[col] > b[col]) return 1;
        return 0;
    });
    self.update()
  })
  // 並び替え呼び出し
  this.opts.obs.on('u_desc', function (col) {
    self.items1.sort(function(a,b){
        if(a[col] > b[col]) return -1;
        if(a[col] < b[col]) return 1;
        return 0;
    });
    self.update();
  })

</tansho>
