##
# encryptor_sas.rb
# Created October, 2015
# By Ron Bowes
#
# See: LICENSE.md
#
##

require 'sha3'

module EncryptorSAS
  SAS_WORDLIST = [
    'Abate',
    'Absorb',
    'Ache',
    'Acidy',
    'Across',
    'After',
    'Alike',
    'Amount',
    'Amuse',
    'Annoy',
    'Annuls',
    'Ardent',
    'Ascot',
    'Bait',
    'Barons',
    'Barret',
    'Bask',
    'Becurl',
    'Befool',
    'Bell',
    'Bifold',
    'Bogie',
    'Boxen',
    'Bozo',
    'Broke',
    'Bulby',
    'Bunny',
    'Calmly',
    'Canary',
    'Cargo',
    'Chirp',
    'Chroma',
    'Cleft',
    'Coke',
    'Column',
    'Comely',
    'Cometh',
    'Convoy',
    'Corn',
    'Cough',
    'Cruxes',
    'Cued',
    'Darter',
    'Dash',
    'Dating',
    'Deadly',
    'Deaf',
    'Decade',
    'Deepen',
    'Depict',
    'Domed',
    'Dorper',
    'Drafts',
    'Dried',
    'Duff',
    'Durian',
    'Early',
    'Easily',
    'Eggars',
    'Emboss',
    'Emit',
    'Encode',
    'Ennui',
    'Envied',
    'Essay',
    'Evites',
    'Evoke',
    'Exotic',
    'Facile',
    'Fate',
    'Feisty',
    'Fewest',
    'Fifty',
    'Filth',
    'Finer',
    'Fished',
    'Flacks',
    'Flaunt',
    'Fleecy',
    'Flied',
    'Foams',
    'Foxes',
    'Freely',
    'Frozen',
    'Genome',
    'Gibbon',
    'Gifts',
    'Giving',
    'Gold',
    'Gone',
    'Gouge',
    'Grocer',
    'Grows',
    'Half',
    'Handle',
    'Harold',
    'Harp',
    'Hedges',
    'Hither',
    'Hobbit',
    'Hobble',
    'Hoods',
    'Hooked',
    'Horror',
    'Horsed',
    'Hound',
    'Huns',
    'Ices',
    'Impish',
    'Jiber',
    'Jiggy',
    'Kelpy',
    'Keyman',
    'Khan',
    'Killer',
    'Klutzy',
    'Lair',
    'Lashes',
    'Libate',
    'Liming',
    'Lonely',
    'Looks',
    'Lordy',
    'Lush',
    'Mailer',
    'Maps',
    'Mayo',
    'Mcgill',
    'Mona',
    'Motive',
    'Mousy',
    'Neigh',
    'Ninjas',
    'Nodule',
    'Nuns',
    'Obese',
    'Olive',
    'Omelet',
    'Omen',
    'Otto',
    'Outran',
    'Ouzo',
    'Owls',
    'Papism',
    'Parrot',
    'Peace',
    'Pearly',
    'Peaty',
    'Pedal',
    'Pegged',
    'Petals',
    'Phials',
    'Pianos',
    'Pierce',
    'Pigs',
    'Pikey',
    'Pitch',
    'Plato',
    'Plays',
    'Plight',
    'Poetic',
    'Poker',
    'Polite',
    'Pontic',
    'Pony',
    'Powers',
    'Poxes',
    'Prams',
    'Pulped',
    'Purr',
    'Push',
    'Quint',
    'Random',
    'Rapier',
    'Ravel',
    'Real',
    'Rebolt',
    'Recoil',
    'Redear',
    'Reink',
    'Ripe',
    'Riprap',
    'Roger',
    'Ropers',
    'Roving',
    'Rumor',
    'Sanded',
    'Sawlog',
    'Sawman',
    'Scribe',
    'Scruff',
    'Seitan',
    'Sense',
    'Shirks',
    'Sippy',
    'Sitcom',
    'Slumpy',
    'Softy',
    'Sonar',
    'Sonny',
    'Sophic',
    'Spear',
    'Spiced',
    'Spikey',
    'Spine',
    'Spoofy',
    'Spring',
    'Static',
    'Staved',
    'Stilt',
    'Stinty',
    'Stirs',
    'Storer',
    'Story',
    'Strode',
    'Stump',
    'Suited',
    'Surfs',
    'Swatch',
    'Swum',
    'Tables',
    'Taking',
    'Tattoo',
    'Teal',
    'Teeth',
    'Telco',
    'Timer',
    'Tins',
    'Tonite',
    'Tore',
    'Tort',
    'Tried',
    'Trivia',
    'Tubule',
    'Tusked',
    'Twins',
    'Twos',
    'Unborn',
    'Undam',
    'Unwrap',
    'Upcurl',
    'Upseal',
    'Visas',
    'Volume',
    'Waded',
    'Wages',
    'Ware',
    'Wears',
    'Wicked',
    'Winful',
    'Wisely',
    'Wisp',
    'Yerba',
    'Zester',
    'Zoner',
    'Zootic',
  ]

  def get_sas()
    return SHA3::Digest::SHA256.digest("authstring" +
      Encryptor.bignum_to_binary(@keys[:shared_secret]) +
      Encryptor.bignum_to_binary(@keys[:their_public_key].x) +
      Encryptor.bignum_to_binary(@keys[:their_public_key].y) +
      Encryptor.bignum_to_binary(@keys[:my_public_key].x) +
      Encryptor.bignum_to_binary(@keys[:my_public_key].y)
    )[0,6].bytes().map() { |b| SAS_WORDLIST[b] }.join(' ')
  end
end
