# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.delete_all

events = [
          {name: 'Animetal Lady Marathon II',
           description: 'Animetal Lady Marathon II (アニメタル・レディー・マラソンII Animetaru Redī Marason Tsū?) is the second and final studio album by Animetal Lady (Animetal with Mie of Pink Lady as the vocalist). As with Animetal Lady Marathon, the album consists of heavy metal covers of shōjo anime theme songs, children\'s anime theme songs, and other anime theme songs sung by women. The album features a guest appearance by former Megadeth guitarist Marty Friedman.',
           start: 'Thu Sep 24 11:07:58 AST 2015',
           finish: 'Thu Sep 24 11:09:14 AST 2015',
           location: 'Queens Park, St. Michael, Barbados'},
          {name: 'Sala\'s Gift: My Mother\'s Holocaust Story',
           description: 'Sala\'s Gift: My Mother\'s Holocaust Story is an account by Ann Kirschner of her mother\'s experiences in the Holocaust, based primarily on a collection of letters her mother gave her, that she had received while in Nazi labor camps, written by about 80 correspondents. The most famous of the letter writers was Sala\'s friend Ala Gertner, who was hanged at Auschwitz for her role in the only armed uprising at the camp.',
           start: 'Thu Sep 24 11:16:47 AST 2015',
           finish: 'Thu Sep 24 11:16:53 AST 2015',
           location: 'Somewhere in the middle of barbados'},
          {name: 'Hippocamelus',
           description: 'Hippocamelus is a genus of Cervidae, the deer family. It comprises two Andean species, commonly known as the huemul (from the Mapuche language), and the taruca.

Both species have a stocky, thick, and short-legged body. They live at high altitudes in the summer, then move down the mountains in the fall and spend the winter in sheltered forested valleys. Areas with fresh water are preferred. They are herbivores that feed primarily on herbaceous plants and shrubs as well as sedges, lichens, and grasses found between the rocks on high peaks. They are active during daytime and have a lifespan of about ten years.[citation needed]',
           start: 'Thu Sep 24 11:38:25 AST 2015',
           finish: 'Thu Sep 24 11:38:29 AST 2015',
           location: 'An address in St. Vincent'},
          {name: 'John Carlisle (actor)',
           description: 'In his early teens Carlisle decided that he wanted to become an actor. He started acting in amateur productions until he was called up for National Service. Upon his release he worked odd jobs determined to finance an acting course at RADA. Eventually, he was able to enter RADA to find out that all his hard work would not have been necessary as he had been entitled to a council grant all along.

On completion of his training at RADA, Carlisle joined Harrogate Repertory and subsequently appeared in repertory all over the country, i.e. in Ipswich, Birmingham and Liverpool.[1]',
           start: 'Thu Sep 24 11:39:31 AST 2015',
           finish: 'Thu Sep 24 11:39:35 AST 2015',
           location: 'Some location in Canada'},
          {name: 'Colchester County, Nova Scotia',
           description: 'The appellation Colchester was applied in 1780 to the district previously called "Cobequid," and was derived from the town of Colchester in Essex. The old name Cobequid was derived from the Mi\'kmaq word "Wagobagitk" meaning "the bay runs far up", in reference to the area surrounding the easternmost inlet of the Minas Basin, a body of water called Cobequid Bay.',
           start: 'Thu Sep 24 11:41:59 AST 2015',
           finish: 'Thu Sep 24 11:42:02 AST 2015',
           location: 'Some location in China'},
          {name: 'Frank Egharevba',
           description: 'After playing in the youth team of SK Rapid Wien until 2003 he moved in summer that year to Ukraine and played for one year with reserves squad of FC Karpaty Lviv.

It was in summer 2004 that Egharevba begin his senior career by signing with Polish club TKS Tomasovia Tomaszów Lubelski where he will stay until summer 2006. During this period he was loaned twice to other stronger Polish clubs, first in the second half of the 2004-05 season to Widzew Łódź and second time in the second half of the 2005-06 to Śląsk Wrocław. After the contract expired in summer 2006, he moved to Switzerland and signed with FC Naters where he will have a major role in the club by scoring 15 goals in 26 league matches. After that season Austrian club SK Schwadorf 1936 signed him in summer 2007, where 9 goals in 24 league matches called the attention of VfB Admira Wacker Mödling to sign him in the next summer. Not having much chances to play with Admira, he will return to Schwadorf as a loaned player for the second half of the 2008-09 season where he will return to the good exhibitions by scoring 7 goals in 14 league matches. At the end of the season Egharevba received an offer from Serbian SuperLiga club FK Javor Ivanjica where he will play 13 league matches scoring once but, probably because of the introduction of foreign players limit by the federation and the fact that the club already had a number of African and South American players made him being dropt from the chart for the second half of the season.',
           start: 'Thu Sep 24 11:43:28 AST 2015',
           finish: 'Thu Sep 24 11:43:38 AST 2015',
           location: 'Some location in Brazil'}
         ]

events.each do |e|
  Event.create(e)
end
