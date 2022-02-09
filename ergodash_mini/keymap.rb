kbd = Keyboard.new

kbd.split = true
kbd.uart_pin = 3
kbd.mutual_uart_at_my_own_risk = true

kbd.init_pins(
  [ 6, 7, 8, 9 ],
  [ 29, 28, 27, 26, 22, 20, 23 ]
)

kbd.add_layer :default, %i[
  KC_ESC    KC_Q      KC_W      KC_E      KC_R      KC_T      KC_MINS   KC_EQL    KC_Y      KC_U      KC_I      KC_O      KC_P       KC_BSPC
  CTL_TB    KC_A      KC_S      KC_D      KC_F      KC_G      KC_LBRC   KC_RBRC   KC_H      KC_J      KC_K      KC_L      KC_SCOLON  KC_QUOT
  KC_LSFT   KC_Z      KC_X      KC_C      KC_V      KC_B      LOWER     RAISE     KC_N      KC_M      KC_COMM   KC_DOT    KC_SLASH   KC_BSLS
  EMOJI     ________  ________  ________  KC_LALT   KC_SPC    GUI_EI    GUI_JP    KC_ENT    KC_RSFT   KC_LEFT   KC_DOWN   KC_UP      KC_RIGHT
]

kbd.add_layer :raise, %i[
  KC_TILD   KC_EXLM   KC_AT     KC_HASH   KC_DLR    KC_PERC   KC_UNDS   KC_PLUS   KC_CIRC   KC_AMPR   KC_ASTER  KC_LPRN   KC_RPRN    KC_BSPC
  CTL_TB    KC_F1     KC_F2     KC_F3     KC_F4     KC_F5     KC_LCBR   KC_RCBR   KC_LEFT   KC_DOWN   KC_UP     KC_RGHT   KC_COLON   KC_DQUO
  KC_LSFT   KC_F6     KC_F7     KC_F8     KC_F9     KC_F10    LOWER     RAISE     KC_N      KC_M      KC_LABK   KC_RABK   KC_QUES    KC_PIPE
  KC_VOLDOWN KC_VOLUP ________  KC_F12    KC_LALT   KC_SPC    KC_LGUI   KC_RGUI   KC_ENT    KC_RSFT   KC_HOME   KC_PGDN   KC_PGUP    KC_END
]

kbd.add_layer :lower, %i[
  KC_GRV    KC_1      KC_2      KC_3      KC_4      KC_5      KC_UNDS   KC_PLUS   KC_6      KC_7      KC_8      KC_9      KC_0       KC_BSPC
  CTL_TB    ________  ________  ________  ________  ________  KC_LCBR   KC_RCBR   KC_LEFT   KC_DOWN   KC_UP     KC_RGHT   KC_COLN    KC_DQT
  KC_LSFT   ________  ________  ________  ________  ________  LOWER     RAISE     KC_N      KC_M      KC_LABK   KC_RABK   KC_QUES    KC_PIPE
  ________  ________  ________  ________  KC_LALT   KC_SPC    KC_LGUI   KC_RGUI   KC_ENT    KC_RSFT   KC_HOME   KC_PGDN   KC_PGUP    KC_END
]

class Emoji
  EMOJIS = %w(
    grapes melon watermelon lemon banana apple green_apple cherries peach pear pineapple strawberry
  )

  SIZE = EMOJIS.size

  def take
    i = rand % SIZE
    ':' + EMOJIS[i] + ':'
  end
end

emoji = Emoji.new
kbd.define_mode_key :EMOJI, [ Proc.new { kbd.macro emoji.take }, :KC_NO, 300, nil ]

kbd.define_mode_key :RAISE, [ :KC_NO, :raise, 130, 150 ]
kbd.define_mode_key :LOWER, [ :KC_NO, :lower, 130, 150 ]
kbd.define_mode_key :GUI_EI, [ :KC_LANG2, :KC_LGUI, 110, 150 ]
kbd.define_mode_key :GUI_JP, [ :KC_LANG1, :KC_RGUI, 110, 150 ]
kbd.define_mode_key :CTL_TB, [ :KC_TAB, :KC_LCTL, 150, 150 ]

kbd.start!
