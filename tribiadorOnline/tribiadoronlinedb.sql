-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2014 a las 11:37:29
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tribiadoronlinedb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add tema', 7, 'add_tema'),
(20, 'Can change tema', 7, 'change_tema'),
(21, 'Can delete tema', 7, 'delete_tema'),
(22, 'Can add pregunta', 8, 'add_pregunta'),
(23, 'Can change pregunta', 8, 'change_pregunta'),
(24, 'Can delete pregunta', 8, 'delete_pregunta'),
(25, 'Can add respuesta', 9, 'add_respuesta'),
(26, 'Can change respuesta', 9, 'change_respuesta'),
(27, 'Can delete respuesta', 9, 'delete_respuesta'),
(28, 'Can add perfil', 10, 'add_perfil'),
(29, 'Can change perfil', 10, 'change_perfil'),
(30, 'Can delete perfil', 10, 'delete_perfil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$7QXsrNH4mF6a$AApborGBCV28eg105MRnqFft0cj4aQff4PeAU1T4Z9k=', '2014-12-04 01:53:24', 1, 'daniel', '', '', 'daniel@hotmail.com', 1, 1, '2014-12-02 21:00:18'),
(2, 'pbkdf2_sha256$12000$6EWnf3uH2GmJ$bhKW/fo+oBlK0JfmKP2bGZTbLeoYZi5B5Ob5zAWWUfc=', '2014-12-04 10:01:19', 0, 'jose', 'jose', 'caba', 'jose@hotmail.com', 0, 1, '2014-12-02 21:01:17'),
(3, 'pbkdf2_sha256$12000$us60EKNi7lkc$DRVRqbyoUyDa1TmcpnrjEQCAykNhBr6TqN7LUYA3k7w=', '2014-12-03 07:22:18', 0, 'abc', 'abc', 'aerss', 'abc@hotmail.com', 0, 1, '2014-12-02 21:56:54'),
(4, 'pbkdf2_sha256$12000$kxmYgAZcsKYX$QeTtKTabvzd31FEYaGyj5+QUG2+EqZLb1clZmhLpNRU=', '2014-12-04 01:51:05', 0, 'oso', 'oscar', 'leiton', 'oscar@hotmail.com', 0, 1, '2014-12-03 06:11:02'),
(5, 'pbkdf2_sha256$12000$Fr6mZr367Qap$ZakbLOYv8hn7ZvE2sMBx1Rmj3WfpOuMHDkK880B3M9w=', '2014-12-03 07:21:50', 0, 'dog', 'percy', 'rojas', 'percy@hotmail.com', 0, 1, '2014-12-03 06:25:12'),
(6, 'pbkdf2_sha256$12000$xD7VQFFRY2T3$HMGybzCuOgXPjnr3ryBXrUevyxMlEJ0AkJjntG31WOI=', '2014-12-04 09:48:13', 0, 'pepe', 'pedro', 'montes', 'pedro@hotmail.com', 0, 1, '2014-12-03 07:04:14'),
(7, 'pbkdf2_sha256$12000$B1aYkxqsq9W9$aSBn++1rqRA4KrvVyE/YG3y+lkcK8POPo3xIpL2INEQ=', '2014-12-03 07:41:30', 0, 'meliton', 'milton', 'ruis', 'milton@hotmail.com', 0, 0, '2014-12-03 07:40:11'),
(8, 'pbkdf2_sha256$12000$YwqFLyQiHfyD$D8uU40cNUilcMuqttsvCeNH+BOGkP68f8ryhnS4xpXQ=', '2014-12-04 01:32:40', 0, 'jade', 'juana', 'valdez', 'juana@hotmail.com', 0, 0, '2014-12-04 01:32:40'),
(9, 'pbkdf2_sha256$12000$0UqwT4DYlFLN$+bDyri8X00y/i8nXVD40jQxypNtkjdC1xBCCPFlu3pY=', '2014-12-04 01:50:44', 0, 'jadel', 'juana', 'valdez', 'juana@hotmail.com', 0, 0, '2014-12-04 01:34:36'),
(10, 'pbkdf2_sha256$12000$yBu3WEStZjJk$ZoMMS8MN6W9noaYQG8/BZ1nF6JciL3g7Zus5yQZI1SU=', '2014-12-04 01:43:10', 0, 'amaca', 'rodo', 'vives', 'rodo@hotmail.com', 0, 0, '2014-12-04 01:38:14'),
(11, 'pbkdf2_sha256$12000$LVAqMG7DmZ1R$96ex9urJKx8+y8CA8z27dX9FpXwuoDmeWtCnypkfBHE=', '2014-12-04 02:16:53', 0, 'jope', 'josel', 'berill', 'josel@hotmail.com', 0, 1, '2014-12-04 02:13:29'),
(12, 'pbkdf2_sha256$12000$qoWy3B8PyKaU$6jZZsguGvtm0daLeFvdy/RU4Lr36yebklkrrWHzKbzg=', '2014-12-04 10:37:04', 0, 'duda', 'eduardo', 'valentino', 'eduardo@hotmail.com', 0, 1, '2014-12-04 09:58:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'tema', 'principal', 'tema'),
(8, 'pregunta', 'principal', 'pregunta'),
(9, 'respuesta', 'principal', 'respuesta'),
(10, 'perfil', 'usuario', 'perfil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2014-12-02 20:59:48'),
(2, 'auth', '0001_initial', '2014-12-02 20:59:53'),
(3, 'admin', '0001_initial', '2014-12-02 20:59:54'),
(4, 'principal', '0001_initial', '2014-12-02 20:59:56'),
(5, 'sessions', '0001_initial', '2014-12-02 20:59:57'),
(6, 'usuario', '0001_initial', '2014-12-02 20:59:57'),
(7, 'principal', '0002_auto_20141203_1716', '2014-12-04 01:16:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1eowwblootn87h1wthn0x9cl34h9evn0', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 06:42:27'),
('2ofyf6naazx5lygwn6l9scppa7y08vem', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 07:14:57'),
('4rfr18y2qzfz6vujai1n3tbwh53y6o76', 'OGYwZGVkZDBlODBhZWQ0YzAwZGQ2MGQ2OWUwMGFiZmY5ODFiZjlmNDp7ImNvbnQiOjB9', '2014-12-18 02:15:33'),
('95g3bur0o32avwltzh64oqzh4tbvy2o6', 'OGYwZGVkZDBlODBhZWQ0YzAwZGQ2MGQ2OWUwMGFiZmY5ODFiZjlmNDp7ImNvbnQiOjB9', '2014-12-18 02:13:48'),
('d8ths9erax2g3ix9d75njyf85ex321k1', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 07:28:28'),
('di3y47ov05cbskivbcpjtqr6frkec2hs', 'OGYwZGVkZDBlODBhZWQ0YzAwZGQ2MGQ2OWUwMGFiZmY5ODFiZjlmNDp7ImNvbnQiOjB9', '2014-12-18 01:50:44'),
('jzq5ljhgj1cyqvljlxplymzuqbe3h8ck', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 06:23:05'),
('n05m32720l6mlw6zjudppsdff43dnczr', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 06:22:05'),
('no3g9opgjyr16w7h87k072d69bjuhovf', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 06:41:52'),
('ofksnnbrqe7epwj1f04p9ablepfvsje4', 'OGYwZGVkZDBlODBhZWQ0YzAwZGQ2MGQ2OWUwMGFiZmY5ODFiZjlmNDp7ImNvbnQiOjB9', '2014-12-18 01:43:10'),
('qp88ln2eicjkh000zxz10oj0wzxt0zwy', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 07:28:03'),
('sjbfnf5u419l52xult7c3v8rktfc16jv', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 06:12:19'),
('sosnj5gb7ga0gb6nj0unhq35z5ax6c8q', 'OGYwZGVkZDBlODBhZWQ0YzAwZGQ2MGQ2OWUwMGFiZmY5ODFiZjlmNDp7ImNvbnQiOjB9', '2014-12-18 02:16:11'),
('tnc7up35el25xxllvtezydqk5v7ge7m2', 'OGYwZGVkZDBlODBhZWQ0YzAwZGQ2MGQ2OWUwMGFiZmY5ODFiZjlmNDp7ImNvbnQiOjB9', '2014-12-18 01:42:56'),
('ue9lzr5uhxe4rlyhp3rgru0fwuu9rk8m', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 07:14:25'),
('uokh92aat7j0yyqfjzxddrym3ymg5l03', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 06:20:47'),
('vzuct4sbcrjcm82j0op2cyigac2yshl9', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 06:19:34'),
('xr5bdwiqayxqp74036ixiqk4fcwmo0a7', 'OGYwZGVkZDBlODBhZWQ0YzAwZGQ2MGQ2OWUwMGFiZmY5ODFiZjlmNDp7ImNvbnQiOjB9', '2014-12-18 02:14:07'),
('z5qkdkawetl6jz5t2r9h31dngolbt82r', 'MWIwNDYxOGJjYzI2ZjU2ZWE2ZmUzYjAzNDM1YWRiN2JkNzVjZTc0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjOTVjYWE1ODUyMGJiYjZlMjI4YWIzM2JlZjI5ZGM1M2ZiYmUwNDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjZ9', '2014-12-17 19:01:47'),
('znwlbjtc91jkyhoqpwbe2c3g3jcsgpk5', 'MzBjMjMzMGZlODBhYjJiY2IyMDdkNTE3Y2FjMTI3Mzc3OGQyMTk5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImJiYWU2YjkxNGQwNzNhZjI0OWFiOTM5MmYxZTc1MzcyNjRkNjQ1OTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==', '2014-12-18 10:37:04'),
('zok3zzsi9bvpjvcrp4zk54a8wt8ip8gr', 'NDRiMDJmZjg5MGJiNWRkODdhNGZjNGQwNjRhOTVlNmU0NDBhNDA3ODp7fQ==', '2014-12-17 12:27:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principal_pregunta`
--

CREATE TABLE IF NOT EXISTS `principal_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `tema_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_pregunta_c80e9cdc` (`tema_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `principal_pregunta`
--

INSERT INTO `principal_pregunta` (`id`, `nombre`, `tema_id`) VALUES
(2, '¿De que nacionalidad es Leonel Messi?', 2),
(3, 'qqw', 2),
(5, '¿La película Cielo Octubre en homenaje a quien se lo hizo?', 5),
(6, '¿La película Sin Limites es de tipo?', 5),
(13, 'swswsw', 2),
(14, '¿Quien fue Albert E.?', 1),
(15, '¿Quien fue Albert E.?', 1),
(16, '¿Quien fue que rebelo a serca de teoría de la relatividad?', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principal_respuesta`
--

CREATE TABLE IF NOT EXISTS `principal_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta_correcta` varchar(500) NOT NULL,
  `respusta_opcional` varchar(500) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respusta_opcional3` varchar(500) NOT NULL,
  `respusta_opcional4` varchar(500) NOT NULL,
  `respusta_opcional5` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_respuesta_5e7715cc` (`pregunta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `principal_respuesta`
--

INSERT INTO `principal_respuesta` (`id`, `respuesta_correcta`, `respusta_opcional`, `pregunta_id`, `respusta_opcional3`, `respusta_opcional4`, `respusta_opcional5`) VALUES
(3, 'Hommer', 'Saicosqui', 5, '1', '1', '1'),
(4, 'Ciencia ficcion', 'Comedia', 6, '1', '1', '1'),
(11, 'ssws', 'swws', 13, 'swsw', 'swsw', 'sws'),
(12, 'Un cientifico', 'cientifico', 14, 'judio', 'aleman', 'EEUU'),
(13, 'Un cientifico', 'cientifico', 15, 'judio', 'aleman', 'EEUU'),
(14, 'Albert E.', 'Neuthon', 16, 'Pascal', 'Juanes', 'Julios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principal_tema`
--

CREATE TABLE IF NOT EXISTS `principal_tema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `principal_tema`
--

INSERT INTO `principal_tema` (`id`, `nombre`) VALUES
(1, 'ciencia'),
(5, 'Cine'),
(3, 'Cultura'),
(2, 'Deportes'),
(4, 'Politica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_perfil`
--

CREATE TABLE IF NOT EXISTS `usuario_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(30) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `usuario_perfil`
--

INSERT INTO `usuario_perfil` (`id`, `pais`, `avatar`, `user_id`) VALUES
(1, 'Costa Rica', 'img_user/01_about_02.jpg', 2),
(2, 'Argentina', 'img_user/Fondo_Escritorio.jpg', 3),
(3, 'Peru', 'img_user/wear_goggles.jpg', 4),
(4, 'EEUU', 'img_user/liftoffsts26.jpg', 5),
(5, 'Peru', 'img_user/Fondo2.jpg', 6),
(6, '', '', 7),
(7, '', '', 8),
(8, '', '', 9),
(9, '', '', 10),
(10, 'Argentin0', 'img_user/_JRA9088.jpg', 11),
(11, 'España', 'img_user/bg_image29.jpg', 12);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `principal_pregunta`
--
ALTER TABLE `principal_pregunta`
  ADD CONSTRAINT `principal_pregunta_tema_id_765f0f28_fk_principal_tema_id` FOREIGN KEY (`tema_id`) REFERENCES `principal_tema` (`id`);

--
-- Filtros para la tabla `principal_respuesta`
--
ALTER TABLE `principal_respuesta`
  ADD CONSTRAINT `principal_respuest_pregunta_id_765e65da_fk_principal_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `principal_pregunta` (`id`);

--
-- Filtros para la tabla `usuario_perfil`
--
ALTER TABLE `usuario_perfil`
  ADD CONSTRAINT `usuario_perfil_user_id_5a3d2d00_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
