<oddscart>

  <h1>cart</h1>
  <div each={ cart }>
    <input type="checkbox" checked={ done } onclick={ parent.toggle }>&nbsp;{ name }&nbsp;{ odds }
  </div>

  <input type="checkbox" checked={ check_flg == 1 ? "checked" : "" }  onclick={ check_flg == 1 ? hide_check : all_check } disabled={ cart.length == 0 }>全選択
  <button class="btn btn-primary" disabled={ cart.filter(only_done).length == 0 } onclick={ cart_all_remove }>{ cart.filter(only_done).length } 件を削除</button>

  // 初期値
  var self = this
  self.check_flg = 0

  // 色んな画面からのデータをまとめて表示
  self.cart = []
  this.opts.obs.on('start', function (cart_items) {
    self.cart.push({ name: cart_items.name, odds: cart_items.odds })
    self.update()
  })

  hide_check(e) {
    self.check_flg = 0
    for( let n in self.cart) {
      self.cart[n].done = false
    }
  }

  all_check(e) {
    self.check_flg = 1
    for( let n in self.cart) {
      self.cart[n].done = true
    }
  }

  cart_all_remove(e) {
    self.check_flg = 0
    self.cart = self.cart.filter(function(item) {
      return !item.done
    })
  }

  only_done(item) {
    return item.done
  }

  toggle(e) {
    var item = e.item
    item.done = !item.done
    return true
  }

</oddscart>
