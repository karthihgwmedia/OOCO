<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'ooco_beauty');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '#nMzE$]YRkcj@FIB[=/gma`.Q.SK323c,?R0,A>VG@j^-O3#5n|yNr=v}27U{ 1H');
define('SECURE_AUTH_KEY',  'c:={ ^o<N8ASAr49W,[S:dM}3aN}hw_B$Vw21WWW?p341M@dLml*P);>*Eq,mw_r');
define('LOGGED_IN_KEY',    '>Yp)z3EH%d! /m^0ygz5Yq5li~(oI4PNw?#{W=b]g`g29D;YAIZ$2qD;`@ ~0`?X');
define('NONCE_KEY',        '@>rUuI]]+SUXGrSDo`.|m#1Cmch`fUIjeKy0!CamT56A25hBf(eC]l=N@uuG9xeu');
define('AUTH_SALT',        ':zHUorcIe:?WV%s$O=YAX;B?0MG%B,ec$cHzVFo%gmCqU,^gq%}N1]*IVa=Q]^F-');
define('SECURE_AUTH_SALT', '?zgh80Z`.&&)VxJosc2p,^FXJ,(Vl6yzk/{h%zc67yx?B+]aqQL2L,_)F+sK4C1+');
define('LOGGED_IN_SALT',   'Df%^Xp7DC`m}E|#~`:|9r!&r`u%j~x=X[Mh()/?MJo5lp1VN(>sa?B7av3-0]z02');
define('NONCE_SALT',       '6A)R*1x!>>3t&?25t6e3*j5IqrijVv|]#uR|(~/Os>^Yf.<t1/$jZ-uRHk/wzLU2');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
