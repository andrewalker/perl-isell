--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: isell; Type: SCHEMA; Schema: -; Owner: andre
--

CREATE SCHEMA isell;



SET search_path = isell, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: client; Type: TABLE; Schema: isell; Owner: andre; Tablespace: 
--

CREATE TABLE client (
    id SERIAL NOT NULL,
    login text not null,
    password text not null,
    address text NOT NULL,
    city text NOT NULL,
    cpf text NOT NULL,
    email text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    state text NOT NULL,
    telephone text NOT NULL
);

CREATE TABLE payment (
    id SERIAL NOT NULL,
    confirmed_at timestamp without time zone NOT NULL,
    started_at timestamp without time zone NOT NULL,
    status text NOT NULL,
    comments text NOT NULL
);

CREATE TABLE product (
    id SERIAL NOT NULL,
    version bigint NOT NULL,
    amount_in_stock integer NOT NULL,
    category_id bigint NOT NULL,
    description text NOT NULL,
    image_url text NOT NULL,
    name text NOT NULL,
    price real NOT NULL,
    year integer NOT NULL
);


CREATE TABLE product_category (
    id serial NOT NULL,
    version bigint NOT NULL,
    name text NOT NULL
);

CREATE TABLE shopping_order (
    id serial NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


CREATE TABLE shopping_order_item (
    shopping_order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL
);


CREATE TABLE shopping_order_payment (
    shopping_order_payments_id bigint,
    payment_id bigint
);
--
-- Data for Name: product; Type: TABLE DATA; Schema: isell; Owner: andre
--

COPY product (id, version, amount_in_stock, category_id, description, image_url, name, price, year) FROM stdin;
8	0	20	6	Desenvolvido pelos criadores da série Grand Theft Auto, o estúdio Rockstar North, Grand Theft Auto V é o maior e mais ambicioso episódio já feito. Situado na intrigante cidade de Lost Santos e seus arredores, Grand Theft Auto V apresenta a você um mundo de uma dimensão e de detalhes nunca vistos, desde picos de montanhas até as profundezas do oceano. Com uma nova visão de liberdade em mundo aberto, jogabilidade com missões e diversos modos online, Grand Theft Auto V é focado na eterna busca pelo dólar em uma releitura moderna do sul da Califórnia.	http://static.kabum.com.br/produtos/fotos/38977/38977_index_g.jpg	GTA V - Grand Theft Auto V	150	2000
9	0	10	6	O verdadeiro deus da guerra busca sua vingança com a execução de Zeus enquanto continua sua escalada rumo ao Monte Olimpo. Kratos busca nada menos que o assassinato de figuras ´imortais´ da mitologia grega. Kratos, neste game, é muito mais que violência. Banhos de sangue são abundantes neste jogo, ainda mais quando a energia do protagonista está baixa. Com o elevado poder de processamento do PlayStation 3, os desenvolvedores podem aplicar uma série de pequenos detalhes bastante atraentes. Por exemplo: após combates realmente sangrentos, Kratos fica vermelho devido às manchas do fluido e é capaz até de deixar pegadas de sangue no caminho. É claro que o efeito não é tão realista, pois, se fosse assim, Kratos iria ficar totalmente coberto de sangue a todo o momento.	http://static.kabum.com.br/produtos/fotos/9493/9493_index_g.jpg	God of War 3	70	2000
10	0	30	6	Experimente a emoção de marcar golaços no FIFA 14. Jogue como se estivesse disputando uma grande partida de futebol de verdade. Inovações no premiado jogo permitem construir jogadas no meio-campo e ditar o ritmo da partida. Sinta a tensão conforme as chances de gol são criadas e experimente a emoção de estufar as redes. Um novo recurso chamado Pure Shot e um novo sistema de física da bola vão transformar a finalização das jogadas, fazendo cada tentativa de gol parecer real e emocionante quando o jogador consegue a finalização perfeita. O FIFA 14 traz interessantes recursos on-line e serviços em tempo real para conectar os torcedores à pulsação do esporte - e entre si - por meio do EA SPORTS Football Club. O FIFA 14 é a rede social do futebol, onde torcedores interagem, competem e compartilham informações com milhares de pessoas em todo o mundo.	http://static.kabum.com.br/produtos/fotos/42267/42267_index_g.jpg	FIFA 14	130	2000
11	0	24	6	O titulo The Last of Us é uma experiência que promete redefinir o gênero com uma mistura de sobrevivência e ação, contando uma história centrada nos personagens, sobre uma praga moderna que dizima a espécie humana há 20 anos atrás. A natureza invade a civilização, forçando os poucos sobreviventes a lutar por comida, armas e o que mais puderem encontrar. Joel, um sobrevivente durão, e Ellie, uma jovem corajosa e bem mais esperta do que aparenta sua idade, precisam trabalhar juntos para sobreviver nesta jornada pelo que sobrou dos Estados Unidos.	http://static1.kabum.com.br/produtos/fotos/41140/41140_index_g.jpg	The Last of Us	130	2000
12	0	28	6	A busca da lendária ´Atlantis das Areias´ impulsiona o caçador de tesouros Nathan Drake em uma viagem ao coração do deserto árabe. Quando os terríveis segredos desta cidade perdida são desenterrados, a busca de Drake transforma-se em uma tentativa desesperada de sobrevivência que estreita os limites de sua resistência e força-o a confrontar seus medos mais profundos.	http://static.kabum.com.br/produtos/fotos/23583/23583_index_g.jpg	Uncharted 3: Drakes Deception	90	2013
13	0	1	6	Assassin´s Creed: Brotherhood foca-se nos desdobramentos da época de Ezio Auditore da Firenze. Só que ele não é mais o novato destreinado de Assassin’s Creed 2. Com o passar dos anos, Ezio transformou-se — juntamente com suas habilidades sobre-humanas — em uma verdadeira lenda entre os seus contemporâneos... E também em uma pedra no sapato lendária para alguns sujeitos importantes do período da Renascença.	http://static2.kabum.com.br/produtos/fotos/12826/12826_index_g.jpg	Assassins Creed: Brotherhood	70	2013
14	0	2	6	O best-seller, de ação em primeira pessoa de todos os tempos, retorna com a seqüência épica para o jogo multiplayer. Call of Duty: Modern Warfare 3 começa nos momentos após o final trágico de Modern Warfare 2 com os EUA lutando para repelir um ataque surpresa da Rússia. A ofensiva é ampliada para países europeus como Alemanha, França e Inglaterra.	http://static.kabum.com.br/produtos/fotos/23570/23570_index_g.jpg	Call of Duty: Modern Warfare 3	60	2013
15	0	0	6	Resident Evil 6 é o mais novo game da série de jogos da Capcom que promete agradar os fãs de forma nunca antes vista. Afinal, é graças aos fãs que a saga voltou a ter “zumbis de verdade” como sua principal ameaça, segundo a própria companhia. Para tentar agradar a todos, sem exceção, o game também vai oferecer três campanhas distintas, cada uma com um tom e jogabilidade diferente. Uma delas acompanha o herói Leon S. Kennedy, de Resident Evil 2 e 4, que retorna agora mais velho e mais experiente. A saga de Leon parece ser a mais voltada para o horror, mantendo o clima dos jogos mais antigos. Muito suspense e resolução de quebra-cabeças também aguardam o jogador que irá controlar Leon.	http://static.kabum.com.br/produtos/fotos/32657/32657_index_g.jpg	Resident Evil 6	150	2013
16	0	5	6	Neste game de ação, o jogador controla o mesmo Max Payne, que se encontra mais velho e com muito mais problemas. Desta vez, o plano de fundo não é a cidade de Nova York, como nos antecessores, mas sim São Paulo, uma das maiores metrópoles do Brasil. Payne, após ser despedido do Departamento de Polícia de Nova York, vem para o país tupiniquim para tentar ganhar a vida, e trabalha como segurança para uma família rica. Entretanto, sua profissão faz o personagem encarar diversos problemas. Além de uma aparência física diferente, Payne também tem problemas psicológicos. O durão ex-policial enfrenta conflitos com as drogas e uma estranha obsessão por analgésicos. No game, você ainda contará com o famoso efeito “bullet time”, mas com melhoras significativas. Payne ainda desfruta de um novo sistema de coberturas, além de diversos outros tipos de eventos que envolvem mini games e interação com o ambiente.	http://static.kabum.com.br/produtos/fotos/29569/29569_index_g.jpg	Max Payne 3	120	2013
17	0	4	6	Far Cry 3 é o terceiro jogo da famosa franquia homônima originalmente criada pela desenvolvedora alemã Crytek. Dessa vez, quem está responsável pelo desenvolvimento é a Ubisoft Montreal, que também trabalhou no segundo jogo da série. Felizmente, quem sentiu os problemas de Far Cry 2 deve manter a calma, já que o time de desenvolvimento afirma ter aprendido com seus erros, aprimorando o que estava falho e adicionando novos recursos ideais para os fãs.	http://static.kabum.com.br/produtos/fotos/34607/34607_index_g.jpg	Far Cry 3	90	2013
18	0	2	6	Sinta toda a emoção de pilotar os melhores carros do mundo, nas mais diversas e desafiadoras pistas e estilos de corrida. Se para você isso é pouco, mostre o seu talento configurando os carros e criando novos traçados. Gran Turismo® é a experiência de corrida mais completa e realista de todos os tempos. Uma coleção de carros sem precedentes, quase todos os estilos de corrida, com gráficos fantásticos, recursos on-line e de comunidade por meio do PlayStation®Network. A versão XL EDITION inclui a atualização 2.0 com características melhoradas de jogo, bem como Cupom de Conteúdo para download de novos carros, pistas e mais.	http://static.kabum.com.br/produtos/fotos/32364/32364_index_g.jpg	Gran Turismo 5: XL Edition	70	2013
19	0	20	6	Em desvantagem e desarmados, mas nunca derrotados. Call of Duty: Ghosts é uma evolução extraordinária de uma das maiores franquias de entretenimento de todos os tempos. O novo capítulo de Call of Duty conta com uma nova dinâmica em que os jogadores lutam ao lado de uma nação debilitada que não batalha por liberdade, mas por sobrevivência. Para deixar a nova experiência a todo vapor, a engine de próxima geração apresenta níveis fantásticos de desempenho e imersão, além de manter a velocidade de 60 quadros por segundo em todas as plataformas.	http://static.kabum.com.br/produtos/fotos/45354/45354_index_g.jpg	Call of Duty: Ghosts	150	2013
20	0	20	6	Battlefield 4 é o enorme sucesso dos jogos de ação que definiu um gênero, feito dos momentos que se equilibram entre o jogo e a glória. Momentos esses só encontrados em Battlefield. Com a ajuda da potência e fidelidade da próxima geração do Frostbite 3, o Battlefield 4 proporciona uma experiência dramática e visceral como nenhuma outra. Apenas em Battlefield você irá explodir as fundações de uma represa ou reduzir um arranha-céu a escombros. Apenas em Battlefield você vai liderar um ataque naval na traseira de uma lancha de combate. Battlefield dá a você a liberdade de fazer e ser muito mais enquanto joga com o máximo de intensidade e trilha o seu próprio caminho para a vitória. Além do seu multiplayer inconfundível, Battlefield 4 apresenta uma campanha intensa e dramática focada nos personagens, que tem início com a evacuação de cidadãos norteamericanos importantes de Xangai e acompanha a luta de sua equipe para voltar para casa. Não há comparações. Mergulhe no caos glorioso de uma guerra declarada, só encontrada em Battlefield.	http://static.kabum.com.br/produtos/fotos/45356/45356_index_g.jpg	Battlefield 4	150	2013
21	0	20	6	FIFA Street marca o retorno da clássica franquia de futebol de rua da EA após um hiato de vários anos. O game utiliza a celebrada engine da franquia FIFA para produzir algo realmente genuíno, sobretudo ao concentrar-se nas disputas entre dois jogadores (um contra um) e eliminar boa parte do clima fantasioso que pautou todos os jogos anteriores da série em favor de um clima mais realista. Mas truques não necessariamente indicam uma atmosfera fantasiosa. E, de fato, há vários malabarismos inéditos que se pode fazer com a bola nos pés aqui. Para quantificar, há aproximadamente o dobro de dribles, em relação ao que se pode encontrar na franquia principal de FIFA — incluindo uma variada gama de movimentos aéreos e habilidades que podem ser disparadas em todas as direções (mesmo para se afastar do defensor). Ademais, o chamado “wall play” retorna como parte fundamental da experiência de FIFA Street. De fato, torna-se possível agora não apenas realizar passes improváveis, mas também utilizar a parede para manter a posse de bola, voltando as costas para o defensor. Por fim, há ainda 35 localidades distintas e também times de todas as ligas principais, além de diversas formas de interação social.	http://static.kabum.com.br/produtos/fotos/29897/29897_index_g.jpg	FIFA Street 4	150	2013
22	0	20	6	TOMB RAIDER é uma releitura da clássica franquia de ação e aventura, que irá explorar a origem da história intensa e corajosa de uma personagem icônica. No jogo, Lara Croft vai evoluir de uma mulher jovem e assustada em sua primeira aventura para uma corajosa sobrevivente. Armada com apenas seus instintos e sua habilidade para ir além dos limites da resistência humana, Lara deve lutar, explorar e usar sua inteligência para desvendar a história de uma ilha esquecida e escapar de sua influência implacável. Tomb Raider tem como objetivo reinventar o gênero de ação e recapturar a imaginação dos fãs com a heroína original dos jogos de video game.	http://static3.kabum.com.br/produtos/fotos/38428/38428_index_g.jpg	Tomb Raider	140	2013
23	0	17	7	Foi há quarenta anos, agora ele lembra muito bem. Quando os tempos ficaram difíceis e os pais decidiram que o quarto do alto da escada, que antes era dele, passaria a receber hóspedes. Ele só tinha sete anos. Um dos inquilinos foi o minerador de opala. O homem que certa noite roubou o carro da família e, ali dentro, parado num caminho deserto, cometeu suicídio. O homem cujo ato desesperado despertou forças que jamais deveriam ter sido perturbadas. Forças que não são deste mundo. Um horror primordial, sem controle, que foi libertado e passou a tomar os sonhos e a realidade das pessoas, inclusive os do menino. Ele sabia que os adultos não conseguiriam — e não deveriam — compreender os eventos que se desdobravam tão perto de casa. Sua família, ingenuamente envolvida e usada na batalha, estava em perigo, e somente o menino era capaz de perceber isso. A responsabilidade inescapável de defender seus entes queridos fez com que ele recorresse à única salvação possível: as três mulheres que moravam no fim do caminho. O lugar onde ele viu seu primeiro oceano.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4898770&L=125&qld=50&A=-1&PIM_Id=	O Oceano no Fim do Caminho - Neil Gaiman	19	2013
24	0	17	7	Hazel é uma paciente terminal. Ainda que, por um milagre da medicina, seu tumor tenha encolhido bastante — o que lhe dá a promessa de viver mais alguns anos —, o último capítulo de sua história foi escrito no momento do diagnóstico. Mas em todo bom enredo há uma reviravolta, e a de Hazel se chama Augustus Waters, um garoto bonito que certo dia aparece no Grupo de Apoio a Crianças com Câncer. Juntos, os dois vão preencher o pequeno infinito das páginas em branco de suas vidas.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4073261&L=125&qld=50&A=-1&PIM_Id=	A Culpa é das Estrelas - John Green	23	2013
25	0	17	7	lorem	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=3362929&L=125&qld=50&A=-1&PIM_Id=	Quem é Você, Alasca? - John Green	23	2013
26	0	17	7	Se o assunto é relacionamento, o tipo de garota de Colin Singleton tem nome: Katherine. E em se tratando de Colin e Katherines, o desfecho é sempre o mesmo: ele leva o fora. Já aconteceu muito. Dezenove vezes, para ser exato. Depois do mais recente e traumático término, ele resolve cair na estrada. Dirigindo o Rabecão de Satã, com seu caderninho de anotações no bolso e um melhor amigo bem fora de forma no banco do carona, o ex-garoto prodígio, viciado em anagramas e PhD em levar pés na bunda, descobre sua verdadeira missão: elaborar e comprovar o Teorema Fundamental da Previsibilidade das Katherines, que tornará possível antever, através da linguagem universal da matemática, o desfecho de qualquer relacionamento antes mesmo que as duas pessoas se conheçam. Uma descoberta que vai mudar para sempre a história amorosa do mundo, vai vingar séculos de injusta vantagem entre Terminantes e Terminados e, enfim, elevará Colin Singleton diretamente ao distinto posto de gênio da humanidade. Também, é claro, vai ajudá-lo a reconquistar sua garota. Ou, pelo menos, é isso o que ele espera.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4898770&L=125&qld=50&A=-1&PIM_Id=	O Teorema Katherine - John Green	23	2013
27	0	17	7	Entre 1939 e 1943, Liesel Meminger encontrou a Morte três vezes. E saiu suficientemente viva das três ocasiões para que a própria, de tão impressionada, decidisse nos contar sua história, em "A Menina que Roubava Livros", livro há mais de um ano na lista dos mais vendidos do "The New York Times". Desde o início da vida de Liesel na rua Himmel, numa área pobre de Molching, cidade desenxabida próxima a Munique, ela precisou achar formas de se convencer do sentido da sua existência. Horas depois de ver seu irmão morrer no colo da mãe, a menina foi largada para sempre aos cuidados de Hans e Rosa Hubermann, um pintor desempregado e uma dona de casa rabugenta. Ao entrar na nova casa, trazia escondido na mala um livro, "O Manual do Coveiro". Num momento de distração, o rapaz que enterrara seu irmão o deixara cair na neve. Foi o primeiro de vários livros que Liesel roubaria ao longo dos quatro anos seguintes. E foram estes livros que nortearam a vida de Liesel naquele tempo, quando a Alemanha era transformada diariamente pela guerra, dando trabalho dobrado à Morte. O gosto de rouba-los deu à menina uma alcunha e uma ocupação; a sede de conhecimento deu-lhe um propósito. E as palavras que Liesel encontrou em suas páginas e destacou delas seriam mais tarde aplicadas ao contexto a sua própria vida, sempre com a assistência de Hans, acordeonista amador e amável, e Max Vanderburg, o judeu do porão, o amigo quase invisível de quem ela prometera jamais falar. Há outros personagens fundamentais na história de Liesel, como Rudy Steiner, seu melhor amigo e o namorado que ela nunca teve, ou a mulher do prefeito, sua melhor amiga que ela demorou a perceber como tal. Mas só quem está ao seu lado sempre e testemunha a dor e a poesia da época em que Liesel Meminger teve sua vida salva diariamente pelas palavras, é a nossa narradora. Um dia todos irão conhece-la. Mas ter a sua história contada por ela é para poucos. Tem que valer a pena.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=1658571&L=125&qld=50&A=-1&PIM_Id=	A Menina que Roubava Livros - Marcus Kusak	30	2013
28	0	30	7	Neste novo e fascinante thriller Dan Brown retoma a mistura magistral de história, arte, códigos e símbolos que o consagrou em O código Da Vinci, Anjos e demônios e O símbolo perdido e faz de Inferno sua aposta mais alta até o momento. No coração da Itália, Robert Langdon, o professor de Simbologia de Harvard, é arrastado para um mundo angustiante centrado em uma das obras literárias mais duradouras e misteriosas da história: O Inferno, de Dante Alighieri. Numa corrida contra o tempo, Langdon luta contra um adversário assustador e enfrenta um enigma engenhoso que o arrasta para uma clássica paisagem de arte, passagens secretas e ciência futurística. Tendo como pano de fundo o sombrio poema de Dante, Langdon mergulha numa caçada frenética para encontrar respostas e decidir em quem confiar, antes que o mundo que conhecemos seja destruído.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4886876&L=125&qld=50&A=-1&PIM_Id=	Inferno - Dan Brown	20	2013
29	0	7	7	Pat Peoples, um ex-professor de história na casa dos 30 anos, acaba de sair de uma instituição psiquiátrica. Convencido de que passou apenas alguns meses naquele “lugar ruim”, Pat não se lembra do que o fez ir para lá. O que sabe é que Nikki, sua esposa, quis que ficassem um "tempo separados". Tentando recompor o quebra-cabeças de sua memória, agora repleta de lapsos, ele ainda precisa enfrentar uma realidade que não parece muito promissora. Com seu pai se recusando a falar com ele, sua esposa negando-se a aceitar revê-lo e seus amigos evitando comentar o que aconteceu antes de sua internação, Pat, agora um viciado em exercícios físicos, está determinado a reorganizar as coisas e reconquistar sua mulher, porque acredita em finais felizes e no lado bom da vida. À medida que seu passado aos poucos ressurge em sua memória, Pat começa a entender que "é melhor ser gentil que ter razão" e faz dessa convicção sua meta. Tendo a seu lado o excêntrico (mas competente) psiquiatra Dr. Patel e Tiffany, a irmã viúva de seu melhor amigo, Pat descobrirá que nem todos os finais são felizes, mas que sempre vale a pena tentar mais uma vez. Um livro comovente sobre um homem que acredita na felicidade, no amor e na esperança.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4397478&L=125&qld=50&A=-1&PIM_Id=	O Lado Bom da Vida - Matthew Quick	19	2013
30	0	2	7	É impossível transmitir ao novo leitor todas as qualidades e o alcance do livro. Alternadamente cômica, singela, épica, monstruosa e diabólica, a narrativa desenvolve-se em meio a inúmeras mudanças de cenários e de personagens, num mundo imaginário absolutamente convincente em seu detalhes. Nas palavras do romancista Richard Hughes, ´quanto à amplitude imaginativa, a obra praticamente não tem paralelos e é quase igualmente notável na sua vividez e na habilidade narrativa, que mantêm o leitor preso página após página´. Tolkien criou em O Senhor dos anéis uma nova mitologia, num mundo inventado que demonstrou possuir um poder de atração atemporal.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=457618&L=125&qld=50&A=-1&PIM_Id=	O Senhor dos Anéis, Ed. Completa - J. R. R. Tolkien	143	2013
31	0	10	4	Produzido pelo Max Martin, Overexposed é o quarto álbum de estúdio da banda. Foi gravado em 2011 após o sucesso de “Hands All Over” e do single “Moves Like Jagger”, em parceria com Christina Aguilera. Inclui 13 faixas inéditas! Inclui o mega hit “Moves Like Jagger” e o sucesso “Payphone”. Overexposed é o álbum mais Pop da banda!	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4069923&L=125&qld=50&A=-1&PIM_Id=	Overexposed - Maroon 5	21	2013
32	0	2	4	Desde agosto, quando aconteceu no Japão o Summer Sonic Festival, os fãs do Linkin Park vinham vasculhando a internet atrás de “A Light That Never Comes”, uma colaboração inédita entre a banda e o DJ Steve Aoki, um dos grandes nomes de música eletrônica e dance no mundo. Em setembro, numa estratégia de divulgação que unia tecnologia, games e conectividade, os fãs puderam descobrir o primeiro single inédito de um álbum recheado de remixes: "Recharged", que é o terceiro álbum de remixes de uma das bandas de rock de maior prestígio do planeta. "Recharged" apresenta músicas do Linkin Park remixadas pelos mais renomados nomes da cena eletrônica mundial. Um álbum que nenhum fã vai querer perder!	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=5673876&L=125&qld=50&A=-1&PIM_Id=	Recharged - Linkin Park	28	2013
33	0	2	4	Em seu primeiro disco, "Feito Pra Acabar", Marcelo Jeneci se apresentou para o público com as canções “Pra sonhar” e “Felicidade”. "De Graça", segundo álbum do cantor, mostra um novo Jeneci, amadurecido, depois de passar por momentos marcantes na vida pessoal e profissional. Produzido por Kassin, coproduzido por Adriano Cintra e com arranjos de orquestra de Eumir Deudato, o disco promete aproximar ainda mais o público do músico. São 13 faixas que mostram a mudança na forma de fazer música de Jeneci, sem perder a referência e a fórmula de sucesso do primeiro disco. Dentre elas, podemos destacar a faixa-título do disco, “De graça”, que foi o primeiro single deste trabalho lançado na internet e já é sucesso. As músicas compostas em parceria com Arnaldo Antunes, “Alento” e “Tudo bem, tanto faz”, também dão um toque especial ao CD.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=6000013&L=125&qld=50&A=-1&PIM_Id=	De Graça - Marcelo Jeneci	25	2013
34	0	2	4	Chega ao Brasil o quarto álbum da banda Soldiers Of Jah Army, mais conhecida como SOJA. O CD Strength To Survive traz o reggae já mais maduro do grupo de garotos da Virgínia, EUA. A banda iniciou a carreira em 1997 e hoje já é um grande nome do circuito de reggae – o SOJA já tocou em mais de 15 países e conquistou grande público, inclusive no Brasil. Eles estiveram aqui em 2010 numa turnê com 14 apresentações, 11 cidades, sendo 10 capitais, com um público total de mais de 50 mil pessoas. Em 2011, o grupo tocou para mais de 80 mil pessoas no festival de música SWU, em São Paulo. É possível notar a expressão da banda por terras tropicais pela forte presença nas redes sociais, só no Facebook são 500 mil brasileiros. Há um vídeo de “True love”, feito por fãs brasileiros e legendado em português, que já registra mais de 11 milhões de views. 	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4261554&L=125&qld=50&A=-1&PIM_Id=	Strength to Survive - SOJA	28	2013
35	0	10	5	A série de tv que conquistou milhares de espectadores no mundo chegou ao fim neste ano com a oitava temporada. House m.d., a série médica de maior sucesso que já recebeu cinco emmy® e dois globos de ouro® para o ator hugh laurie (dr. Gregory house) e milhares de outras importantes premiações e indicações, recebe a caixa definitiva em dvd, contendo cento e setenta e sete episódios, divididos em quarenta e seis discos.desde 2004 no ar na tv americana e no brasil em exibição no universal channel, onde é líder de audiência, house m.d. aborda a vida profissional de dr. House, um médico dissidente, totalmente anti-social, que se especializou em medicina diagnóstica e faz o que for preciso para resolver casos intrigantes que vêm ao seu caminho. Munido de ótima persuasão, dr. House lidera uma equipe de médicos altamente capacitados, mas que nem sempre compartilham da mesma opinião de seu líder.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4257461&L=125&qld=50&A=-1&PIM_Id=	House: Série Completa (46 DVDs)	500	2013
36	0	3	5	Nesta coleção, a saga completa de Harry Potter em DVD: "Harry Potter e a Pedra Filosofal", "Harry Potter e a Câmara Secreta", "Harry Potter e o Prisioneiro de Azkaban", "Harry Potter e o Cálice de Fogo", "Harry Potter e a Ordem da Fênix", "Harry Potter e o Enigma do Príncipe", "Harry Potter e as Relíquias da Morte" (Parte 1 e Parte 2).	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=4897059&L=125&qld=50&A=-1&PIM_Id=	Harry Potter - A Coleção Completa	89.9000015	2013
37	0	9	5	Num futuro distante, com os Estados Unidos sob o comando de um regime totalitário, a jovem Katniss Everdeen (Jennifer Lawrence) se torna uma gladiadora de seu território, tendo que enfrentar representantes de outros doze territórios em um reality show mortal.	http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=6102378&L=125&qld=50&A=-1&PIM_Id=	Jogos Vorazes	19.8999996	2013
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: isell; Owner: andre
--

COPY product_category (id, version, name) FROM stdin;
4	0	CD
5	0	DVD
6	0	Jogos
7	0	Livros
\.



-- Name: client_cpf_key; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_cpf_key UNIQUE (cpf);


--
-- Name: client_email_key; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_email_key UNIQUE (email);


--
-- Name: client_pkey; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: payment_pkey; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: product_category_pkey; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);



--
-- Name: product_pkey; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);



--
-- Name: shopping_order_item_pkey; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY shopping_order_item
    ADD CONSTRAINT shopping_order_item_pkey PRIMARY KEY (shopping_order_id, product_id);


--
-- Name: shopping_order_pkey; Type: CONSTRAINT; Schema: isell; Owner: andre; Tablespace: 
--

ALTER TABLE ONLY shopping_order
    ADD CONSTRAINT shopping_order_pkey PRIMARY KEY (id);


--
-- Name: fk19f52db75354bd4b; Type: FK CONSTRAINT; Schema: isell; Owner: andre
--

ALTER TABLE ONLY shopping_order
    ADD CONSTRAINT fk19f52db75354bd4b FOREIGN KEY (client_id) REFERENCES client(id);


--
-- Name: fkb70f5f7ec0d9fb1a; Type: FK CONSTRAINT; Schema: isell; Owner: andre
--

ALTER TABLE ONLY shopping_order_payment
    ADD CONSTRAINT fkb70f5f7ec0d9fb1a FOREIGN KEY (shopping_order_payments_id) REFERENCES shopping_order(id);


--
-- Name: fkb70f5f7ed37b76a9; Type: FK CONSTRAINT; Schema: isell; Owner: andre
--

ALTER TABLE ONLY shopping_order_payment
    ADD CONSTRAINT fkb70f5f7ed37b76a9 FOREIGN KEY (payment_id) REFERENCES payment(id);


--
-- Name: fkdef2009ba22126d8; Type: FK CONSTRAINT; Schema: isell; Owner: andre
--

ALTER TABLE ONLY shopping_order_item
    ADD CONSTRAINT fkdef2009ba22126d8 FOREIGN KEY (shopping_order_id) REFERENCES shopping_order(id);


--
-- Name: fkdef2009bf8472209; Type: FK CONSTRAINT; Schema: isell; Owner: andre
--

ALTER TABLE ONLY shopping_order_item
    ADD CONSTRAINT fkdef2009bf8472209 FOREIGN KEY (product_id) REFERENCES product(id);


--
-- Name: fked8dccef4c45a6b8; Type: FK CONSTRAINT; Schema: isell; Owner: andre
--

ALTER TABLE ONLY product
    ADD CONSTRAINT fked8dccef4c45a6b8 FOREIGN KEY (category_id) REFERENCES product_category(id);


--
-- PostgreSQL database dump complete
--

