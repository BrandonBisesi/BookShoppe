-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 04:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshoppe`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookId` int(10) NOT NULL,
  `BookTitle` varchar(100) NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `GenreId` int(10) DEFAULT NULL,
  `BookCover` varchar(100) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookId`, `BookTitle`, `ISBN`, `Author`, `GenreId`, `BookCover`, `Description`) VALUES
(9, 'Harry Potter And The Philosopher\'s Stone', '155192398X', 'J. K. Rowling', 1, NULL, 'Harry Potter thinks he is an ordinary boy - until he is rescued by an owl, taken to Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. The Reason: HARRY POTTER IS A WIZARD!'),
(10, 'Where The Crawdads Sing', '9780735219090', 'Delia Owens', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735219090.jpg', 'A woman who survived alone in the marsh becomes a murder suspect.'),
(11, 'Verses For The Dead', '9781538747209', 'Douglas Preston and Lincoln Child', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781538747209.jpg', 'Agents Pendergast and Coldmoon track a killer who removes hearts and leaves handwritten letters.'),
(12, 'The Reckoning', '9780385544153', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385544160.jpg', 'A decorated World War II veteran shoots and kills a pastor.'),
(13, 'Fire And Blood', '9781524796280', 'George RR Martin', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781524796280.jpg', 'The first volume of the two-part history of the Targaryens in Westeros.'),
(14, 'Every Breath', '9781538728529', 'Nicholas Sparks', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781538728529.jpg', 'Difficult choices surface when Hope Anderson and Tru Walls meet in a North Carolina seaside town.'),
(15, 'Circe', '9780316556347', 'Madeline Miller', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316556347.jpg', 'Zeus banishes Helios\' daughter to an island, where she must choose between living with gods or mortals.'),
(16, 'Nine Perfect Strangers', '9781250069825', 'Liane Moriarty', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250069849.jpg', 'A romance writer becomes fascinated by the owner and director of a health resort.'),
(17, 'Target: Alex Cross', '9780316273947', 'James Patterson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316417501.jpg', 'Alex Cross returns for the 26th book in the series bearing his name.'),
(18, 'A Delicate Touch', '9780735219250', 'Stuart Woods', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735219274.jpg', 'The 48th book in the Stone Barrington series.'),
(19, 'Dark Sacred Night', '9780316484800', 'Michael Connelly', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316486675.jpg', 'Detective RenÃ©e Ballard teams up with the retired detective Harry Bosch, who is working on a cold case.'),
(20, 'The Boy', '9781101985397', 'Tami Hoag', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781101985403.jpg', 'Nick Fourcade and Annie Broussard, a husband-and-wife detective team, investigate a boyâ€™s murder and the disappearance of his babysitter.'),
(21, 'Long Road To Mercy', '9781538761571', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781538761571.jpg', 'The F.B.I. agent Atlee Pine must choose between protecting her career or the United States\' democracy.'),
(22, 'Past Tense', '9780399593512', 'Lee Child', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399593512.jpg', 'Jack Reacher explores the New England town where his father was born.'),
(23, 'Elevation', '9781982102319', 'Stephen King', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781982102319.jpg', 'A man who is losing weight without getting thinner forms an unlikely alliance with his neighbors who are dealing with prejudices.'),
(24, 'An American Marriage', '9781616208776', 'Tayari Jones', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781616207601.jpg', 'A newlywed couple\'s relationship is tested when the husband is sentenced to 12 years in prison.'),
(26, 'The Hill We Climb', '9780593465271', 'Amanda Gorman', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780593465271.jpg', 'The poem read on President Joe Biden\'s Inauguration Day, by the youngest poet to write and perform an inaugural poem.'),
(27, 'The Four Winds', '9781250178602', 'Kristin Hannah', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250178602.jpg', 'As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.'),
(28, 'The Red Book', '9780316499408', 'James Patterson and David Ellis', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316499408.jpg', 'The second book in the Black Book thriller series. Chicago detective Billy Harney investigates his own past.'),
(29, 'The Midnight Library', '9780525559474', 'Matt Haig', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780525559474.jpg', 'Nora Seed finds a library beyond the edge of the universe that contains books with multiple possibilities of the lives one could have lived.'),
(30, 'Klara And The Sun', '9780593318171', 'Kazuo Ishiguro', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780593318171.jpg', 'An â€œArtificial Friendâ€ named Klara is purchased to serve as a companion to an ailing 14-year-old girl.'),
(31, 'The Invisible Life Of Addie Larue', '9780765387561', 'V.E. Schwab', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780765387561.jpg', 'A Faustian bargain comes with a curse that affects the adventure Addie LaRue has across centuries.'),
(32, 'Win', '9781538748213', 'Harlan Coben', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781538748213.jpg', 'Windsor Horne Lockwood III might rectify cold cases connected to his family that have eluded the F.B.I. for decades.'),
(33, 'Life After Death', '9781982139131', 'Sister Souljah', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781982139131.jpg', 'In a sequel to â€œThe Coldest Winter Ever,â€ Winter Santiaga emerges after time served and seeks revenge.'),
(34, 'The Lost Apothecary', '9780778311010', 'Sarah Penner', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780778311010.jpg', 'An aspiring historian in London finds a clue that might put to rest unsolved apothecary murders from 200 years ago.'),
(35, 'Sunflower Sisters', '9781524796402', 'Martha Hall Kelly', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781524796402.jpg', 'During the Civil War, sisters Georgeanna and Eliza join the war effort together while sisters Jemma and Patience are enslaved on separate plantations.'),
(36, 'Eternal', '9780525539766', 'Lisa Scottoline', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780525539766.jpg', 'Three people involved in a love triangle find everything they hold dear is tested as Mussoliniâ€™s power grows and laws change in Rome.'),
(37, 'The Vanishing Half', '9780525536291', 'Brit Bennett', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780525536291.jpg', 'The lives of twin sisters who run away from a Southern Black community at age 16 diverge as one returns and the other takes on a different racial identity but their fates intertwine.'),
(38, 'Of Women And Salt', '9781250776686', 'Gabriela Garcia', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250776686.jpg', 'Jeanette, the daughter of a Cuban immigrant, takes in the daughter of a neighbor detained by ICE and seeks to learn about her own family history.'),
(39, 'We Begin At The End', '9781250759665', 'Chris Whitaker', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250759665.jpg', 'Trouble might start for the chief of police and a self-proclaimed outlaw teenager when a man is released from prison.'),
(40, 'A Court Of Silver Flames', '9781681196282', 'Sarah J. Maas', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781681196282.jpg', 'The fifth book in A Court of Thorns and Roses series. Nesta Archeron is forced into close quarters with a warrior named Cassian.'),
(41, 'The Rooster Bar', '9780385541176', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385541183.jpg', 'Three students at a sleazy for-profit law school hope to expose the student-loan banker who runs it.'),
(42, 'Origin', '9780385514231', 'Dan Brown', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385542692.jpg', 'A symbology professor goes on a perilous quest with a beautiful museum director.'),
(43, 'The People Vs. Alex Cross', '9780316273909', 'James Patterson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316273909.jpg', 'Detective Cross takes on a case even though he has been suspended from the department and taken to federal court to stand trial on murder charges.'),
(44, 'Artemis', '9780553448122', 'Andy Weir', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780553448122.jpg', 'A small-time smuggler living in a lunar colony schemes to pay off an old debt by pulling off a challenging heist.'),
(45, 'The Midnight Line', '9780399593482', 'Lee Child', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399593499.jpg', 'Jack Reacher tracks down the owner of a pawned West Point class ring and stumbles upon a large criminal enterprise.'),
(46, 'Year One', '9781250122957', 'Nora Roberts', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250122957.jpg', 'When a pandemic strikes and the world spins into chaos, several travelers head west to find a new life.'),
(47, 'Tom Clancy Power And Empire', '9780735215894', 'Marc Cameron', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735215900.jpg', 'President Jack Ryan seeks to identify the hidden forces escalating the tensions between China and the United States.'),
(48, 'End Game', '9781455586608', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455586639.jpg', 'Jessica Reel and Will Robie fight a dangerous adversary in Colorado.'),
(49, 'Sleeping Beauties', '9781501163401', 'Stephen King and Owen King', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781501163401.jpg', 'Women who fall asleep become shrouded in mysterious cocoons while the men battle one another.'),
(50, 'Little Fires Everywhere', '9780735224292', 'Celeste Ng', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735224308.jpg', 'An artist upends a quiet town outside Cleveland.'),
(51, 'Uncommon Type', '9781101946152', 'Tom Hanks', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781101946152.jpg', 'Seventeen short stories, each incorporating a typewriter, by the Academy Award-winning actor.'),
(52, 'Hardcore Twenty-four', '9780399179198', 'Janet Evanovich', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399179204.jpg', 'When a homeless man is murdered, the bounty hunter Stephanie Plum searches for the killer.'),
(53, 'A Column Of Fire', '9780525954972', 'Ken Follett', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735224476.jpg', 'A pair of lovers find themselves on opposite sides of a conflict while Queen Elizabeth fights to maintain her throne.'),
(54, 'Two Kinds Of Truth', '9780316225908', 'Michael Connelly', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316225915.jpg', 'While he investigates the murder of two pharmacists, an old case comes back to haunt Harry Bosch.'),
(55, 'Manhattan Beach', '9781476716732', 'Jennifer Egan', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781476716732.jpg', 'The first female diver at the Brooklyn Naval Yard during World War II tries to understand why her father disappeared.'),
(56, 'The Whistler', '9780385541190', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385541206.jpg', 'A whistleblower alerts a Florida investigator to judicial corruption involving the Mob and Indian casinos.'),
(57, 'Cross The Line', '9780316407090', 'James Patterson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316407168.jpg', 'Detective Alex Cross and his wife, Bree, team up to catch a killer causing chaos in Washington, D.C.'),
(58, 'Two By Two', '9781455520695', 'Nicholas Sparks', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455520701.jpg', 'A man who became a single father when his marriage and business collapsed learns to take a chance on a new love.'),
(59, 'The Underground Railroad', '9780385542364', 'Colson Whitehead', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385542364.jpg', 'A slave girl heads toward freedom on the network, envisioned as actual tracks and tunnels.'),
(60, 'Tom Clancy True Faith And Allegiance', '9780399176814', 'Mark Greaney', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399176814.jpg', 'Jack Ryan Jr., working for a secret organization, seeks to prevent complicated terrorist strikes set in motion by a hacker. Clancy died in 2013.'),
(61, 'No Man\'s Land', '9781455586516', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455586516.jpg', 'John Puller, a special agent with the Army, searches for the truth about his mother, who disappeared 30 years ago.'),
(62, 'Small Great Things', '9780345544957', 'Jodi Picoult', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345544964.jpg', 'A medical crisis entangles a black nurse, a white supremacist father and a white lawyer.'),
(63, 'Night School', '9780804178808', 'Lee Child', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780804178815.jpg', 'Jack Reacher, still in the Army, becomes involved in an investigation with elite agents from the F.B.I. and C.I.A.'),
(64, 'Turbo Twenty-three', '9780345543004', 'Janet Evanovich', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345543028.jpg', 'The bounty hunter Stephanie Plum juggles the investigation of a crime in an ice cream factory and the two men in her life.'),
(65, 'All The Light We Cannot See', '9781476746586', 'Anthony Doerr', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781476746586.jpg', 'The lives of a blind French girl and a gadget-obsessed German boy before and during World War II.'),
(66, 'The Wrong Side Of Goodbye', '9780316225946', 'Michael Connelly', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316225953.jpg', 'The detective Harry Bosch aids a billionaire in search of a possible heir.'),
(67, 'The Seventh Plague', '9780062381682', 'James Rollins', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062381705.jpg', 'The 12th Sigma Force thriller follows a deadly pathogen in Egypt and a Russian assassin in the Arctic.'),
(68, 'Moonglow', '9780062225559', 'Michael Chabon', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062225559.jpg', 'A novel that presents itself as a memoir of an elderly World War II veteran and his wife, a Holocaust survivor, who resemble Chabonâ€™s maternal grandparents.'),
(69, 'The Chemist', '9780316387835', 'Stephenie Meyer', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316387859.jpg', 'A specialist in chemically controlled torture, on the run from her former employers, takes on one last job.'),
(70, 'Commonwealth', '9780062491794', 'Ann Patchett', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062491817.jpg', 'Five decades in the lives of two families â€” parents, children, siblings, stepchildren â€” remade by divorce.'),
(71, 'The Whole Town\'s Talking', '9781400065950', 'Fannie Flagg', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781400065950.jpg', 'A century of life in small-town Elmwood Springs, Mo.'),
(72, 'Odessa Sea', '9780399575518', 'Clive Cussler and Dirk Cussler', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399575518.jpg', 'Trying to locate an Ottoman shipwreck in the Black Sea, the NUMA director Dirk Pitt encounters more than he expected.'),
(73, 'A Gentleman In Moscow', '9780670026197', 'Amor Towles', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780670026197.jpg', 'A Russian count undergoes 30 years of house arrest in the Metropol hotel, across from the Kremlin.'),
(74, 'Swing Time', '9781594203985', 'Zadie Smith', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781594203985.jpg', 'The British novelist explores friendship, race, music and global politics.'),
(75, 'The Nightingale', '9780312577223', 'Kristin Hannah', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781466850606.jpg', 'Two sisters in World War II France: one struggling to survive in the countryside, the other joining the Resistance.'),
(76, 'Rogue Lawyer', '9780385539432', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385539449.jpg', 'The attorney Sebastian Rudd is a â€œlone gunmanâ€ who hates injustice and the system and defends unpopular clients.'),
(78, 'Gray Mountain', '9780385537148', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385537148.jpg', 'A downsized Wall Street lawyer joins a legal clinic in a small Virginia town.'),
(79, 'Revival', '9781476770383', 'Stephen King', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781476770406.jpg', 'The continuing relationship, over five decades, between a disgraced clergyman and a drug-addicted musician.'),
(80, 'Hope To Die', '9780316210966', 'James Patterson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316210942.jpg', 'Detective Alex Crossâ€™s family is kidnapped by a madman who wants to turn Cross into a perfect killer.'),
(83, 'A Time For Mercy', '9780385545969', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385545969.jpg', 'The third book in the Jake Brigance series. A 16-year-old is accused of killing a deputy in Clanton, Miss., in 1990.'),
(84, 'Ready Player Two', '9781524761332', 'Ernest Cline', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781524761332.jpg', 'In a sequel to â€œReady Player One,â€ Wade Watts discovers a technological advancement and goes on a new quest.'),
(85, 'Deadly Cross', '9780316420259', 'James Patterson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316420259.jpg', 'The 28th book in the Alex Cross series. An investigation of a double homicide sends Alex Cross to Alabama.'),
(86, 'The Return', '9781538728574', 'Nicholas Sparks', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781538728574.jpg', 'A doctor serving in the Navy in Afghanistan goes back to North Carolina where two women change his life.'),
(92, 'The President Is Missing', '9780316412698', 'James Patterson and Bill Clinton', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316412698.jpg', 'President Jonathan Duncan, a Gulf War veteran and widower, takes on adversaries at home and abroad.'),
(93, 'The Outsider', '9781501180989', 'Stephen King', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781501180989.jpg', 'A detective investigates a seemingly wholesome member of the community when an 11-year-old boyâ€™s body is found.'),
(94, 'Tom Clancy Line Of Sight', '9780735215924', 'Mike Maden', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735215931.jpg', 'Jack Ryan Jr. risks his life to protect a woman in a country on the brink of civil war.'),
(95, 'The Pharaoh Key', '9781455525829', 'Douglas Preston and Lincoln Child', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455525829.jpg', 'Gideon Crew and Manuel Garza go on a mission to solve the mystery of a centuries-old stone tablet.'),
(96, 'Shelter In Place', '9781250161598', 'Nora Roberts', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250161611.jpg', 'Survivors of a mass shooting outside a mall in Portland, Me., develop different coping mechanisms and face a new menace.'),
(97, 'The Death Of Mrs. Westaway', '9781501156212', 'Ruth Ware', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781501156212.jpg', 'A tarot card reader mistakenly receives an inheritance letter and attends the funeral of the deceased.'),
(98, 'The Fallen', '9781538761397', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781538761397.jpg', 'Amos Decker puts his talents toward solving a string of murders.'),
(99, 'The Gray Ghost', '9780735218734', 'Clive Cussler and Robin Burcell', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735218741.jpg', 'Sam and Remi Fargo search for a Rolls-Royce prototype that has vanished for a second time.'),
(100, 'Before The Storm', '9780399594090', 'Christie Golden', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399594090.jpg', 'An impending war may destroy Azeroth. Based on the online role-playing game World of Warcraft.'),
(101, 'When Life Gives You Lululemons', '9781476778440', 'Lauren Weisberger', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781476778464.jpg', 'Emily Charlton plans a comeback from the suburbs. From the author of \"The Devil Wears Prada.\"'),
(102, 'Before We Were Yours', '9780425284681', 'Lisa Wingate', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780425284681.jpg', 'A South Carolina lawyer learns about the questionable practices of a Tennessee orphanage.'),
(103, 'There There', '9780525520375', 'Tommy Orange', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780525520375.jpg', 'A multigenerational story exploring the plight of the urban Native American.'),
(104, 'A Place For Us', '9781524763558', 'Fatima Farheen Mirza', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781524763558.jpg', 'The bonds and betrayals of an Indian Muslim family are exposed when they gather for a wedding in California.'),
(105, 'The 17th Suspect', '9780316274043', 'James Patterson and Maxine Paetro', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316412261.jpg', 'The latest installment in the Womenâ€™s Murder Club series.'),
(106, 'Something In The Water', '9781524797188', 'Catherine Steadman', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781524797195.jpg', 'A documentary filmmaker and an investment banker must decide whether they should protect a secret.'),
(107, 'Camino Island', '9780385543026', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385543057.jpg', 'A search for stolen rare manuscripts leads to a Florida island.'),
(108, 'The Identicals', '9780316375191', 'Elin Hilderbrand', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316375207.jpg', 'Complications in the lives of identical twins who were raised by their divorced parents, one on Nantucket, one on Marthaâ€™s Vineyard.'),
(109, 'Tom Clancy: Point Of Contact', '9780735215863', 'Mike Maden', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735215863.jpg', 'Jack Ryan Jr. helps thwart a global financial crisis. (Tom Clancy died in 2013.)'),
(110, 'Into The Water', '9780735211209', 'Paula Hawkins', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780735211216.jpg', 'In this psychological thriller by the author of â€œThe Girl on the Train,â€ women are found drowned in a river in an English town.'),
(111, 'Dragon Teeth', '9780062473356', 'Michael Crichton', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062473356.jpg', 'A paleontological rivalry plays out in 1870s Wyoming. A recently discovered manuscript by Crichton, who died in 2008.'),
(112, 'Come Sundown', '9781250123077', 'Nora Roberts', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250123107.jpg', 'Years after she was kidnapped, a woman returns to her familyâ€™s Montana ranch.'),
(113, 'No Middle Name', '9780399593574', 'Lee Child', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399593581.jpg', 'A complete collection of Jack Reacher stories.'),
(114, 'Nighthawk', '9780399184017', 'Clive Cussler and Graham Brown', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399184031.jpg', 'The NUMA crew races the Russians and Chinese in a hunt for a missing American aircraft.'),
(115, 'The Fix', '9781455586561', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455586561.jpg', 'The detective Amos Decker (â€œMemory Manâ€) witnesses a murder-suicide that turns out to be a matter of national security.'),
(116, '16th Seduction', '9780316274036', 'James Patterson and Maxine Paetro', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316553452.jpg', 'In San Francisco, Detective Lindsay Boxer and the Womenâ€™s Murder Club face their toughest case yet.'),
(117, 'The Rise And Fall Of D. O. D. O.', '9780062409164', 'Neal Stephenson and Nicole Galland', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062409164.jpg', 'A near-future thriller combines science, magic and mystery.'),
(119, 'End Of Watch', '9781501129742', 'Stephen King', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781501134159.jpg', 'The conclusion of the Bill Hodges trilogy.'),
(120, 'Foreign Agent', '9781476789354', 'Brad Thor', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781476789378.jpg', 'The counterterrorism operative Scot Harvath searches for an informant who compromised an American mission in Syria.'),
(121, 'The Girls', '9780812998603', 'Emma Cline', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780812998610.jpg', 'In the summer of 1969, a California teenager is drawn to a Manson-like cult.'),
(122, 'Tom Clancy: Duty And Honor', '9780399176807', 'Grant Blackwood', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399176807.jpg', 'A secretive German organization is trying to kill Tom Clancyâ€™s character Jack Ryan Jr. (Clancy died in 2013.)'),
(123, 'Here\'s To Us', '9780316375146', 'Elin Hilderbrand', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316375153.jpg', 'Sparks fly as a celebrity chefâ€™s ex-wives pile into a small cabin in Nantucket to join his widow for the reading of his will.'),
(124, 'The Girl On The Train', '9781594633669', 'Paula Hawkins', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781594633669.jpg', 'A psychological thriller set in the environs of London.'),
(125, 'After You', '9780525426592', 'Jojo Moyes', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780698152045.jpg', 'In a sequel to â€œMe Before You,â€ Louisa Clark tries to put her life back together after the death of Will Traynor.'),
(126, 'Before The Fall', '9781455561780', 'Noah Hawley', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455561803.jpg', 'After a private jet crashes, a firestorm of media madness ensues.'),
(127, 'The Last Mile', '9781455586455', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455586455.jpg', 'In a sequel to â€œMemory Man,â€ Amos Decker helps the F.B.I. investigate the case of a killer who wins a reprieve.'),
(128, 'The Emperor\'s Revenge', '9780399175961', 'Clive Cussler and Boyd Morrison', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399175961.jpg', 'Juan Cabrillo teams up with a former C.I.A. colleague to thwart a plan involving the death of millions and international economic meltdown.'),
(129, 'Barkskins', '9780743288781', 'Annie Proulx', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780743288781.jpg', 'The Pulitzer Prize-winning novelist traces the destruction of the worldâ€™s forests over 300 years as it follows the descendants of two families.'),
(130, 'The House Of Secrets', '9781455559497', 'Brad Meltzer and Tod Goldberg', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455559503.jpg', 'The host of a conspiracy TV show is dead, his daughter is injured and has lost her memory, and questions proliferate.'),
(133, 'Top Secret Twenty-one', '9780345542922', 'Janet Evanovich', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345542946.jpg', 'The New Jersey bounty hunter Stephanie Plum pursues a dealer who sells more than used cars, while she juggles Joe Morelli, the sexy cop, and the security expert Ranger.'),
(134, 'The Silkworm', '9780316206877', 'Robert Galbraith', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316206914.jpg', 'The private detective Cormoran Strike steps in when the author of a roman Ã  clef set in literary London is murdered'),
(135, 'Written In My Own Heart\'s Blood', '9780385344432', 'Diana Gabaldon', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780440246442.jpg', 'Jamie Fraser and his family face challenges in the 18th and 20th centuries.'),
(136, 'Mr. Mercedes', '9781476754451', 'Stephen King', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781476754468.jpg', 'A driver plows into a crowd, killing eight. The killer then taunts a suicidal ex-cop, who must stop another, deadlier attack.'),
(137, 'All Fall Down', '9781451617788', 'Jennifer Weiner', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781451617801.jpg', 'A woman becomes addicted to pain medication.'),
(138, 'The Goldfinch', '9780316055437', 'Donna Tartt', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316248679.jpg', 'Â A painting smuggled out of the Metropolitan Museum of Art after a bombing becomes a boyâ€™s prize, guilt and burden.'),
(139, 'Rogues', '9780345537263', 'edited  George R R Martin and Gardner Dozois', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780804179607.jpg', 'Twenty-one original stories from well-known writers, including a new â€œGame of Thronesâ€ story.'),
(140, 'The One And Only', '9780345546883', 'Emily Giffin', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345546890.jpg', 'A woman who has grown up and made her life in a small, football-obsessed Texas town begins to expand her horizons.Â '),
(141, 'The Hurricane Sisters', '9780062132529', 'Dorothea Benton Frank', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062132529.jpg', 'Three generations of women endure a stormy summer in South Carolina\'s Lowcountry.'),
(142, 'The Matchmaker', '9780316099752', 'Elin Hilderbrand', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316329026.jpg', 'A Nantucket residentâ€™s life is shaken by a diagnosis and the return to the island of her high school sweetheart.Â '),
(144, 'The Ocean At The End Of The Lane', '9780062255655', 'Neil Gaiman', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062255662.jpg', 'A middle-aged man recalls his lonely boyhood and his friendship with a remarkable girl.'),
(145, 'Inferno', '9780385537858', 'Dan Brown', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781400079155.jpg', 'The symbologist Robert Langdon, on the run in Florence, must decipher a series of codes created by a Dante-loving scientist.Â '),
(146, 'And The Mountains Echoed', '9781594631764', 'Khaled Hosseini', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781594632389.jpg', 'A multigenerational family saga centers on a brother and sister born in Afghanistan; from the author of â€œThe Kite Runner.â€'),
(147, 'Bad Monkey', '9780307272591', 'Carl Hiaasen', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780446556149.jpg', 'A defrocked Miami cop turned restaurant inspector investigates a grisly murder.'),
(148, 'The Heist', '9780345543042', 'Janet Evanovich and Lee Goldberg', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345543042.jpg', 'In the first book of a new series, Kate Oâ€™Hare, an F.B.I. special agent, teams up with Nicolas Fox, a handsome con man, to catch a corrupt investment banker in hiding.Â '),
(149, 'The Silver Star', '9781451661507', 'Jeannette Walls', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781451661545.jpg', 'When their irresponsible mother takes off, a 12-year-old California girl and her sister join the rest of their family in Virginia.Â '),
(150, 'The 9th Girl', '9780525952978', 'Tami Hoag', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781101606599.jpg', 'Two Minneapolis detectives try to discover the identity of the cityâ€™s ninth unidentified female murder victim of the year.Â '),
(151, 'The Last Original Wife', '9780062132468', 'Dorothea Benton Frank', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062132451.jpg', 'An Atlanta woman returns to her hometown, Charleston, to reassess her life.Â '),
(152, 'Revenge Wears Prada', '9781439136638', 'Lauren Weisberger', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781439146958.jpg', 'Andrea Sachs is now running a bridal magazine.'),
(153, 'The Eye Of Moloch', '9781451635836', 'Glenn Beck', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781451635836.jpg', 'Continuing the fight to save America begun in â€œThe Overton Window.â€'),
(154, 'Gone Girl', '9780307588364', 'Gillian Flynn', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780307588388.jpg', 'A woman disappears on her fifth anniversary; is her husband a killer?'),
(155, 'The King\'s Deception', '9780345526540', 'Steve Berry', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345526564.jpg', 'The ex-government operative Cotton Malone stumbles upon a C.I.A. operation attempting to call into question the legitimacy of Elizabeth Iâ€™s reign and her conquest of Ireland.'),
(156, 'The Son', '9780062120397', 'Philipp Meyer', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062120397.jpg', 'More than 150 years in a Texas family, from Comanche raids to the present, and its rise to money and power in the cattle and oil industries.'),
(157, 'The Hit', '9781455521210', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455521289.jpg', 'The government hitman Will Robie uncovers a serious threat as he attempts to take out a fellow assassin who has gone rogue.Â '),
(158, 'Sweet Salt Air', '9781250007032', 'Barbara Delinsky', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250007032.jpg', 'Two women, good friends who have been estranged, come together for a summer on an island off the coast of Maine.'),
(159, 'A Dance With Dragons', '9780553801477', 'George R R Martin', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780553582017.jpg', 'Book 5 of \"A Song of Ice and Fire.\"'),
(160, 'The Kill Room', '9781455517060', 'Jeffery Deaver', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781455517077.jpg', 'The quadriplegic forensics expert Lincoln Rhyme investigates the political assassination of a United States citizen.'),
(161, 'Transatlantic', '9781400069590', 'Colum McCann', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781400069590.jpg', 'The lives of real and fictional characters (Frederick Douglass, George Mitchell, an Irish maid) are woven into historical events in Dublin, Newfoundland and New York.Â '),
(162, 'Ladies\' Night', '9781250019677', 'Mary Kay Andrews', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781250019677.jpg', 'After separating from her husband, a lifestyle blogger moves in with her mother and attends divorce counseling sessions.'),
(163, 'Zero Hour', '9780399162503', 'Clive Cussler and Graham Brown', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780425267776.jpg', 'In the 11th Numa Files novel, Kurt Austin and the rest of the Numa team race to find machines that can cause deadly earthquakes.'),
(164, 'Calico Joe', '9780385536073', 'John Grisham', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385536080.jpg', 'A pitcher beans a promising rookie, ending both their careers; years later, the pitcherâ€™s son brings them together.'),
(165, 'Mission To Paris', '9781400069484', 'Alan Furst', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781400069484.jpg', 'In Paris in 1938, an actor stumbles into the clutches of Nazi conspirators who want to exploit his celebrity.'),
(167, 'Against All Enemies', '9780399157301', 'Tom Clancy with Peter Telep', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780425246061.jpg', 'Maxwell Moore pursues the terrorists who killed his C.I.A. colleagues in a bomb attack in Pakistan.'),
(168, 'One Summer', '9780446583145', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780446583145.jpg', 'As Christmas nears, a terminally ill man is preparing his family for his death when another tragedy strikes.'),
(169, 'State Of Wonder', '9780062049803', 'Ann Patchett', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062049827.jpg', 'In the Amazon basin, a medical researcher searches for her former mentor, a despotic scientist who is developing a miracle fertility drug.'),
(170, 'Folly Beach', '9780061961274', 'Dorothea Benton Frank', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780061961274.jpg', 'A widow returns to her childhood home in South Carolina and finds love and a literary puzzle.'),
(171, 'Carte Blanche', '9781451620696', 'Jeffery Deaver', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781451620696.jpg', 'A young James Bond, on a global mission for a unit of British security, must foil a plot to kill thousands of citizens.'),
(172, 'The Kingdom', '9780399157424', 'Clive Cussler with Grant Blackwood', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399157424.jpg', 'Sam and Remi Fargo, a husband and wife treasure-hunting team, travel to Tibet, Nepal, Bulgaria, India and China, in an adventure involving missing persons, black-market fossils and the ancient Tibetan kingdom of Mustang.'),
(173, 'Sisterhood Everlasting', '9780385521222', 'Ann Brashares', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780679605096.jpg', 'The friends from the Traveling Pants series, now in their late 20s, plan a reunion in Greece.'),
(174, 'Hit List', '9780425241134', 'Laurell K Hamilton', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780515150896.jpg', 'The Mother of All Darkness stalks the vampire hunter Anita Blake, who is pursuing a serial killer in the Pacific Northwest.'),
(175, '10th Anniversary', '9780316036269', 'James Patterson and Maxine Paetro', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316126946.jpg', 'Detective Lindsay Boxer and the Women\'s Murder Club race to find a missing baby.'),
(176, 'Dead Reckoning', '9780441020317', 'Charlaine Harris', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781937007355.jpg', 'The telepathic waitress Sookie Stackhouse seeks the culprit in a firebombing.'),
(177, 'The Jefferson Key', '9780345505514', 'Steve Berry', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345530165.jpg', 'The former government operative Cotton Malone thwarts an assassination attempt on the president and finds himself at dangerous odds with a secret society.'),
(178, 'Buried Prey', '9780399157387', 'John Sandford', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780425247891.jpg', 'The Minneapolis detective Lucas Davenport investigates the murders of two girls who were kidnapped in 1985.'),
(179, 'The Girl Who Kicked The Hornetâ€™s Nest', '9780307269997', 'Stieg Larsson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780307593672.jpg', 'The third volume of the Millennium trilogy, about a Swedish hacker and a journalist.'),
(180, 'Summer Rental', '9780312642693', 'Mary Kay Andrews', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781429987059.jpg', 'Three friends in their mid-30s spend a month on North Carolinaâ€™s Outer Banks.'),
(181, 'Dreams Of Joy', '9781400067121', 'Lisa See', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781400067121.jpg', 'A young woman angry at her mother and aunt over family secrets runs away to Shanghai in search of her birth father.'),
(182, 'The Sixth Man', '9780446573108', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780446573092.jpg', 'The lawyer for a man suspected of being a serial killer is murdered, and two former Secret Service agents are on the case.'),
(183, 'Maine', '9780307595126', 'J Courtney Sullivan', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780307595126.jpg', 'Three generations of a family\'s women take guilt, secrets and old wounds on a beach retreat.'),
(184, 'Before I Go To Sleep', '9780062060556', 'S J Watson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780062060570.jpg', 'After a mysterious accident, an amnesiac cannot remember her past or form new memories.'),
(185, 'The Paris Wife', '9780345521309', 'Paula McLain', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780345521323.jpg', 'Hadley Richardson comes into her own as Ernest Hemingwayâ€™s long-suffering first wife in this novel, set in Paris.'),
(186, 'Robopocalypse', '9780385533850', 'Daniel H Wilson', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780385533850.jpg', 'An artificial intelligence program takes on the persona of a human boy and sets off an apocalyptic robot uprising that could decimate the human race.'),
(187, 'The Overton Window', '9781439184301', 'Glenn Beck', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781439184301.jpg', 'A public relations executive and the woman he loves fight to expose a conspiracy to transform America.'),
(189, 'Knockout', '9780399155840', 'Catherine Coulter', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780399155840.jpg', '\nDillon Savich and Lacey Sherlock â€” F.B.I. agents as well as husband and wife â€” try to protect a 7-year-old with psychic powers from her exploitive criminal uncle.'),
(190, 'The Bourne Deception', '9780446539821', 'Eric Van Lustbader', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780446539821.jpg', '\n\nRobert Ludlumâ€™s character Jason Bourne helps to avert a possible world war.'),
(191, 'The Angel\'s Game', '9780385528702', 'Carlos Ruiz ZafÃ³n', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780767931113.jpg', 'A Barcelona writer accepts a sinister commission.'),
(192, 'Relentless', '9780553807141', 'Dean Koontz', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780553807141.jpg', 'A writer is pursued by a sociopathic critic.'),
(193, 'The Physick Book Of Deliverance Dane', '9781401340902', 'Katherine Howe', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781401341336.jpg', 'A graduate student is caught up in her research on a healer accused of witchcraft in Salem.'),
(194, 'The Scarecrow', '9780316166300', 'Michael Connelly', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316166300.jpg', 'A Los Angeles Times reporter tracks a devious killer.'),
(195, 'Medusa', '9780399155659', 'Clive Cussler and Paul Kemprecos', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780425235096.jpg', 'In the eighth NUMA Files novel, Kurt Austin and his team confront a Chinese crime syndicate and a deadly virus.'),
(196, 'Shanghai Girls', '9781400067114', 'Lisa See', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781400067114.jpg', 'Two Chinese sisters in the 1930s are sold as wives to men from California, and leave their war-torn country to join them.'),
(197, 'The Neighbor', '9780553807233', 'Lisa Gardner', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780553591903.jpg', 'There are many suspects when a pretty teacher disappears.'),
(198, 'Gone Tomorrow', '9780739328460', 'Lee Child', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780739328460.jpg', 'Jack Reacher discovers a conspiracy dating back to the Soviet war in Afghanistan.'),
(199, 'Skin Trade', '9780425227725', 'Laurell K Hamilton', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780515148053.jpg', 'Investigating some killings in Las Vegas, the vampire hunter Anita Blake must contend with the power of the weretigers.'),
(200, 'First Family', '9780446546959', 'David Baldacci', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780446539746.jpg', 'Former Secret Service agents, now P.I.â€™s, search for a child abducted after a party at Camp David.'),
(201, 'Dead And Gone', '9780441017157', 'Charlaine Harris', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780441018512.jpg', 'Sookie Stackhouse searches for the killer of a werepanther.'),
(202, 'Dune Road', '9780670020867', 'Jane Green', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780670020867.jpg', 'In a wealthy Connecticut town, a divorced woman takes a job as an assistant to a famous reclusive novelist with a secret.'),
(203, 'The Help', '9780399155345', 'Kathryn Stockett', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781440697661.jpg', 'A young white woman and two black maids in 1960s Â­Mississippi.'),
(204, 'The 8th Confession', '9780316018760', 'James Patterson and Maxine Paetro', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780446561334.jpg', 'Detective Lindsay Boxer and the Womenâ€™s Murder Club investigate a pair of killings.'),
(205, 'The Host', '9780316068048', 'Stephenie Meyer', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780316218504.jpg', 'In this first adult novel by the author of the Twilight series for teenagers, aliens have taken control of the minds and bodies of most humans, but one woman wonâ€™t surrender; originally published in 2008.'),
(206, 'Roadside Crosses', '9781416549994', 'Jeffery Deaver', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781416549994.jpg', 'A California kinesics expert pursues a killer who stalks victims using information theyâ€™ve posted online.'),
(207, 'Matters Of The Heart', '9780385340274', 'Danielle Steel', NULL, 'https://storage.googleapis.com/du-prd/books/images/9780440243311.jpg', 'A New York photographer falls in love with a sociopathic novelist who lures her to his isolated Irish estate.'),
(208, 'A Rogue Of My Own', '9781416598886', 'Johanna Lindsey', NULL, 'https://storage.googleapis.com/du-prd/books/images/9781416598886.jpg', 'A young ladyâ€™s first brush with intrigue at the court of Queen Victoria.');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `GenreId` int(10) NOT NULL,
  `Genre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`GenreId`, `Genre`) VALUES
(1, 'Fantasy'),
(2, 'Fiction'),
(3, 'Supernatural'),
(4, 'NonFiction'),
(5, 'Horror'),
(6, 'Science Fiction'),
(7, 'Romance'),
(8, 'Mystery'),
(11, 'All');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewId` int(10) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Content` varchar(1000) NOT NULL,
  `Rating` int(1) NOT NULL,
  `BookId` varchar(50) NOT NULL,
  `UserId` int(10) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewId`, `Title`, `Content`, `Rating`, `BookId`, `UserId`, `CreationDate`) VALUES
(14, 'Great', 'Is good.', 5, '9', 1, '2021-03-23 03:42:28'),
(15, 'good', 'It&#039;s good', 4, '9', 1, '2021-03-23 03:43:34'),
(16, 'OK', 'It&#039;s ok.', 3, '9', 2, '2021-03-23 03:45:46'),
(17, 'Not good', 'It&#039;s not good.', 2, '9', 2, '2021-03-23 03:46:05'),
(18, 'Worst book ever', 'It&#039;s Terrible', 1, '9', 2, '2021-03-23 03:46:19'),
(22, 'Magical', 'Welcome to the Wizarding World!', 5, '9', 4, '2021-04-08 13:59:29'),
(25, 'counter hack', 'counter hack', 5, '', 1, '2021-04-12 00:32:04'),
(26, '2', '2', 2, '', 1, '2021-04-12 00:33:48'),
(27, '33', '3', 3, '', 1, '2021-04-12 00:34:08'),
(28, '33', '3', 3, '', 1, '2021-04-12 00:34:39'),
(29, '5', '5', 5, '', 1, '2021-04-12 00:34:49'),
(30, '1', '1', 1, 'nulSAAAAMAAJ', 1, '2021-04-12 00:39:42'),
(31, '5', '5', 5, 'nulSAAAAMAAJ', 1, '2021-04-12 00:39:50'),
(32, 'Magical', 'Magical', 5, 'PZvqzQEACAAJ', 1, '2021-04-12 00:41:08'),
(33, 'harry', 'harry', 5, 'dmouxgEACAAJ', 4, '2021-04-13 20:13:10'),
(34, 'Complete 5 Golden Stars', '&quot;the Penultimate Pendragon&quot;\r\n(as MacHale said, I like the ring to it, don&#039;t you?)\r\nwas Epic!\r\n\r\n\r\n&quot;The war wasn&rsquo;t over. The story didn&rsquo;t end there. Not for Bobby. Not for Saint Dane.\r\nAnd not for us.&quot;\r\n(from Preface of the book, MacHale)\r\n\r\n\r\nthe battle of the Second Earth, home territory of the lead Traveler,\r\n\r\n&amp; Pendragon is nowhere to be found...\r\n\r\noh! another thing! Bobby is 18 now.\r\n\r\nthis book was a constant blending of actions, thrills, riddles &amp; unraveling them, feelz attack &amp; tensions, &amp; things happening so fast, everyone was in a rush, I couldn&#039;t believe how much can happen in 500+ book, I also couldn&#039;t put the book down, even in my 3rd read, &amp; it was just as exciting/shocking as the first time.\r\n\r\n&amp; something just been revealed in re-reading, if you are watchful enough, seeing through the layers of the Plot the author carefully created &amp; can remember previous books while reading this one (it&#039;s ', 5, 'jgA9IRAjME8C', 4, '2021-04-22 01:11:06'),
(35, '2', 'This was so much better than book one, but I still didn&#039;t love it. I do think it&#039;ll be translated well into a television show and I&#039;m looking forward to seeing how it&#039;s adapted. Unfortunately I do think this will be the last Terry Brooks book I read. It wasn&#039;t a terrible read and I actually enjoyed the story! I just don&#039;t think his writing style is for me.', 2, 'J8_ZCwAAQBAJ', 4, '2021-04-22 01:12:20'),
(36, 'Pretty good', 'Ms. Mahoney epitomizes the ideal conclusion to a trilogy with The Stone Demon. Thankfully void of loose ends, neither was each and every situation systematically closed out, as if checking off a list. Admittedly, some resolutions and explanations are needed; and answers were provided in a very satisfactory way, with any remaining questions providing excellent points to ponder long after the story has been told.\r\n\r\nThe first book, The Iron Witch, introduces Donna Underwood who wants nothing more than to be a regular teenager. Such a simple request, yet utterly impossible for her. She has been shrouded in mystery and secrets since she can remember. Flashes from her distant memory serve only to remind her that her father died trying to save her; the magical iron tattoos used to restore her arms will forever make her an outcast; her mother is in an asylum and she is left with only her aunt.\r\n\r\nFurther, Donna isn&rsquo;t being raised as a typical teen. Rather, she is being &ldquo;trained&rd', 4, 'FECuHSJtom8C', 4, '2021-04-22 01:13:32'),
(37, 'Fun little Halloween tale', 'Getting to know Stormy remains a bittersweet experience.', 4, 'ZRdbmjRjljkC', 1, '2021-04-22 01:15:16'),
(38, '2.5 stars', 'The animated art style is great and will please fans of Doug Tennapel, but at 240 pages it&#039;s waaay too long to be what turns out to be just the first act of a larger story.', 3, 'I7ouDwAAQBAJ', 9, '2021-04-22 01:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Role` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `UserName`, `Password`, `Role`) VALUES
(1, 'Bamm', '$2y$10$bqDI7v5nPWIivs1Ju9P4ze/aGOS26YQuasEXVcmwhmivoVx5mp/4S', 1),
(2, 'bam22', '$2y$10$aEqGjQNmQhozY.NjBlsNTu8GN39R8e3nOyOBbrrL3hXsh/0fQgpSe', 1),
(4, 'admin', '$2y$10$cbsUOQHZ4.VQSUvVkD/Y2uVOSY3FI9tf8pPh07DSyws57XrBEcSVq', 2),
(9, 'Dolan', '$2y$10$LhI84yoL.R9RdYmTxwFdUeMDOdpkTLNFs/X7pfP.q8Miuh90hm2rq', 1),
(11, 'encrypt', '$2y$10$oEwPwUCpJeP0XysamSYFBeSUZoAEmLbXVBe3ab71Nvak1i4OTC8ZK', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_images`
--

CREATE TABLE `user_images` (
  `ImageId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `FilePath` varchar(100) NOT NULL,
  `MediumFilePath` varchar(500) NOT NULL,
  `ThumbnailFilePath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_images`
--

INSERT INTO `user_images` (`ImageId`, `UserId`, `FilePath`, `MediumFilePath`, `ThumbnailFilePath`) VALUES
(22, 9, 'userImages/Dolan/Dolanprofile1617845709.3934.png', 'userImages/Dolan/Dolanprofile1617845709.3934_medium.png', 'userImages/Dolan/Dolanprofile1617845709.3934_thumbnail.png'),
(28, 4, 'userImages/admin/adminprofile1618796722.2249.jpg', 'userImages/admin/adminprofile1618796722.2249_medium.jpg', 'userImages/admin/adminprofile1618796722.2249_thumbnail.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookId`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`GenreId`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`ImageId`),
  ADD UNIQUE KEY `UserId` (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `GenreId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_images`
--
ALTER TABLE `user_images`
  MODIFY `ImageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
