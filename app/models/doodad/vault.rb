class Doodad::Vault < Doodad
  attr_reader :open

  def initialize
    super
    @open = false
  end

  def unlock
    gate = game.find_in_tree :castle_gate
    master_key = self.find :master_key

    if gate.open.eql? true
      castle = player.parent
      castle.reset
    elsif master_key.nil?
      "The <strong>vault</strong> requires a <strong>master_key</strong>, where can I find it?"
    else
      castle = self.parent
      castle.children.delete(self)
      princess = NPC::Princess.new
      princess.move_node_to castle
      "The <strong>vault</strong> opens and from the shadows appears ... <strong>sloth</strong>."
    end
  end

  def describe
    'It’s a Franz Jäger 1400k <strong>vault</strong>, supposedly impenetrable and holding the <strong>princess</strong>.'
  end

end
