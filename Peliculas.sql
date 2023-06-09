USE [master]
GO
/****** Object:  Database [Pelis]    Script Date: 2/5/2023 2:42:31 p. m. ******/
CREATE DATABASE [Pelis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pelis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ODISEO\MSSQL\DATA\Pelis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pelis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ODISEO\MSSQL\DATA\Pelis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pelis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pelis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pelis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pelis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pelis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pelis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pelis] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pelis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pelis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pelis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pelis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pelis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pelis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pelis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pelis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pelis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pelis] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pelis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pelis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pelis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pelis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pelis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pelis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pelis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pelis] SET RECOVERY FULL 
GO
ALTER DATABASE [Pelis] SET  MULTI_USER 
GO
ALTER DATABASE [Pelis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pelis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pelis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pelis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pelis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pelis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pelis', N'ON'
GO
ALTER DATABASE [Pelis] SET QUERY_STORE = OFF
GO
USE [Pelis]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 2/5/2023 2:42:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[imagen] [text] NULL,
	[fecha] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (1, N'The Super Mario Bros. Movie', N'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.', N'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg', N'2023-04-05')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (2, N'Shazam! Fury of the Gods', N'Billy Batson and his foster siblings, who transform into superheroes by saying "Shazam!", are forced to get back into action and fight the Daughters of Atlas, who they must stop from using a weapon that could destroy the world.', N'https://image.tmdb.org/t/p/w500/2VK4d3mqqTc7LVZLnLPeRiPaJ71.jpg', N'2023-03-15')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (3, N'Ant-Man and the Wasp: Quantumania', N'Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope''s parents Janet van Dyne and Hank Pym, and Scott''s daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.', N'https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg', N'2023-02-15')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (4, N'Avatar: The Way of Water', N'Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.', N'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg', N'2022-12-14')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (5, N'Creed III', N'After dominating the boxing world, Adonis Creed has been thriving in both his career and family life. When a childhood friend and former boxing prodigy, Damian Anderson, resurfaces after serving a long sentence in prison, he is eager to prove that he deserves his shot in the ring. The face-off between former friends is more than just a fight. To settle the score, Adonis must put his future on the line to battle Damian — a fighter who has nothing to lose.', N'https://image.tmdb.org/t/p/w500/cvsXj3I9Q2iyyIo95AecSd1tad7.jpg', N'2023-03-01')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (6, N'Murder Mystery 2', N'After starting their own detective agency, Nick and Audrey Spitz land a career-making case when their billionaire pal is kidnapped from his wedding.', N'https://image.tmdb.org/t/p/w500/s1VzVhXlqsevi8zeCMG9A16nEUf.jpg', N'2023-03-28')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (7, N'Pirates Down the Street II: The Ninjas from Across', N'The pirates feel right at home in Sandborough, but the atmosphere cools right down when the ninjas come to live in the street. After all, pirates and ninjas are sworn enemies!  While pirate captain Hector Blunderbuss struggles to get rid of his new neighbours, son Billy and ninja daughter Yuka become friends. The pirates challenge the ninjas to the ultimate battle at the village''s annual hexathlon. Who will win the match? Ninjas are faster and more agile of course, but pirates are the best cheats in all of the seven seas...', N'https://image.tmdb.org/t/p/w500/uDsvma9dAwnDPVuCFi99YpWvBk0.jpg', N'2022-04-20')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (8, N'The Communion Girl', N'Spain, late 1980s. Newcomer Sara tries to fit in with the other teens in this tight-knit small town in the province of Tarragona. If only she were more like her extroverted best friend, Rebe. They go out one night at a nightclub, on the way home, they come upon a little girl holding a doll, dressed for her first communion. And that''s when the nightmare begins.', N'https://image.tmdb.org/t/p/w500/sP6AO11a7jWgsmT9T8j9EGIWAaZ.jpg', N'2023-02-10')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (9, N'Puss in Boots: The Last Wish', N'Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.', N'https://image.tmdb.org/t/p/w500/kuf6dutpsT0vSVehic3EZIqkOBt.jpg', N'2022-12-07')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (10, N'65', N'65 million years ago, the only 2 survivors of a spaceship from Somaris that crash-landed on Earth must fend off dinosaurs and reach the escape vessel in time before an imminent asteroid strike threatens to destroy the planet.', N'https://image.tmdb.org/t/p/w500/rzRb63TldOKdKydCvWJM8B6EkPM.jpg', N'2023-03-02')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (11, N'Chupa', N'While visiting family in Mexico, a lonely boy befriends a mythical creature hiding on his grandfather''s ranch and embarks on the adventure of a lifetime.', N'https://image.tmdb.org/t/p/w500/ra3xm8KFAkwK0CdbPRkfYADJYTB.jpg', N'2023-04-07')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (12, N'Evil Dead Rise', N'Two sisters find an ancient vinyl that gives birth to bloodthirsty demons that run amok in a Los Angeles apartment building and thrusts them into a primal battle for survival as they face the most nightmarish version of family imaginable.', N'https://image.tmdb.org/t/p/w500/mIBCtPvKZQlxubxKMeViO2UrP3q.jpg', N'2023-04-12')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (13, N'John Wick: Chapter 4', N'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.', N'https://image.tmdb.org/t/p/w500/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', N'2023-03-22')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (14, N'Kill Boksoon', N'At work, she''s a renowned assassin. At home, she''s a single mom to a teenage daughter. Killing? That''s easy. It''s parenting that''s the hard part.', N'https://image.tmdb.org/t/p/w500/taYgn3RRpCGlTGdaGQvnSIOzXFy.jpg', N'2023-02-17')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (15, N'Cocaine Bear', N'Inspired by a true story, an oddball group of cops, criminals, tourists and teens converge in a Georgia forest where a 500-pound black bear goes on a murderous rampage after unintentionally ingesting cocaine.', N'https://image.tmdb.org/t/p/w500/gOnmaxHo0412UVr1QM5Nekv1xPi.jpg', N'2023-02-22')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (16, N'Gangs of Lagos', N'A group of friends who each have to navigate their own destiny, growing up on the bustling streets and neighborhood of Isale Eko, Lagos.', N'https://image.tmdb.org/t/p/w500/nGwFsB6EXUCr21wzPgtP5juZPSv.jpg', N'2023-04-07')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (17, N'The Pope''s Exorcist', N'Father Gabriele Amorth, Chief Exorcist of the Vatican, investigates a young boy''s terrifying possession and ends up uncovering a centuries-old conspiracy the Vatican has desperately tried to keep hidden.', N'https://image.tmdb.org/t/p/w500/9JBEPLTPSm0d1mbEcLxULjJq9Eh.jpg', N'2023-04-05')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (18, N'Mummies', N'Through a series of unfortunate events, three mummies end up in present-day London and embark on a wacky and hilarious journey in search of an old ring belonging to the Royal Family, stolen by ambitious archaeologist Lord Carnaby.', N'https://image.tmdb.org/t/p/w500/qVdrYN8qu7xUtsdEFeGiIVIaYd.jpg', N'2023-01-05')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (19, N'Supercell', N'Good-hearted teenager William always lived in hope of following in his late father’s footsteps and becoming a storm chaser. His father’s legacy has now been turned into a storm-chasing tourist business, managed by the greedy and reckless Zane Rogers, who is now using William as the main attraction to lead a group of unsuspecting adventurers deep into the eye of the most dangerous supercell ever seen.', N'https://image.tmdb.org/t/p/w500/gbGHezV6yrhua0KfAgwrknSOiIY.jpg', N'2023-03-17')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (20, N'Attack on Titan', N'As viable water is depleted on Earth, a mission is sent to Saturn''s moon Titan to retrieve sustainable H2O reserves from its alien inhabitants. But just as the humans acquire the precious resource, they are attacked by Titan rebels, who don''t trust that the Earthlings will leave in peace.', N'https://image.tmdb.org/t/p/w500/qNz4l8UgTkD8rlqiKZ556pCJ9iO.jpg', N'2022-09-30')
INSERT [dbo].[Movies] ([id], [titulo], [descripcion], [imagen], [fecha]) VALUES (21, N'justiciero 2', N'Robert McCall, un antiguo agente de la CIA que lleva ahora una vida tranquila, abandona su retiro para ayudar a Teri, una joven prostituta que está siendo explotada por la mafia rusa. A pesar de que aseguró no volver a ser violento, contemplar tanta crueldad despertará en Robert un implacable y renovado deseo de justicia... Versión cinematográfica de la serie de televisión de los 80, ''El justiciero''. Tambien conocido como ¨El Protector¨', N'/image/justiciero.jpeg', N'2014')
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
USE [master]
GO
ALTER DATABASE [Pelis] SET  READ_WRITE 
GO
