<umatan>

  <h1>umatan</h1>

  <table class="table table-bordered">
    <thead>
      <tr>
        <td>id</td>
        <td>name | <button name="name" onclick={ asc }>up</button><button name="name" onclick={ desc }>down</button> </td>
        <td>tan1</td>
      </tr>
    </thead>
    <tbody>
      <tr each="{ items2 }">
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
      console.log('umatan mounted');
  });

  // updated event
  this.opts.obs.on('render_odds_umatan',function(e){
      console.log('umatan data');

      self.items2 = opts.item
      self.update()

  });

  // オッズカート投入
  start(e) {
    this.opts.obs.trigger('start', e.item)
  }
  // 並び替えトリガー
  asc(e) {
    this.opts.obs.trigger('asc', e.target.name)
  }
  // 並び替えトリガー
  desc(e) {
    this.opts.obs.trigger('desc', e.target.name)
  }
  // 並び替え呼び出し
  this.opts.obs.on('asc', function (col) {
    self.items2.sort(function(a,b){
        if(a[col] < b[col]) return -1;
        if(a[col] > b[col]) return 1;
        return 0;
    });
    self.update()
  })
  // 並び替え呼び出し
  this.opts.obs.on('desc', function (col) {
    self.items2.sort(function(a,b){
        if(a[col] > b[col]) return -1;
        if(a[col] < b[col]) return 1;
        return 0;
    });
    self.update();
  })

</umatan>
