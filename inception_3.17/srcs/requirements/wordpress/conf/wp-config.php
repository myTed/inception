<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'kyolee' );

/** Database password */
define( 'DB_PASSWORD', '12345' );

/** Database hostname */
define( 'DB_HOST', 'srcs-db_app-1' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'Gc=JvlBKVakU=<xs=Hcy*_gH^Uu6|s7?qxiAUp>T;c*<h{y8H2F_]*pKAWc`jeT]' );
define( 'SECURE_AUTH_KEY',   '[3/SOI}z}6]N-|`>6f~1Q3]BD/6{[?j}rj&`/bb#W{,Jo9]@:W3s0!8#t}X6gMB?' );
define( 'LOGGED_IN_KEY',     '93T3=s{YW_@rLD/9Xte=gi3|cy<]&; )FsBs_!:a>`9vKd-2zF)!ZO#P0x^C@MD2' );
define( 'NONCE_KEY',         '`1[ mZA}Mf)}&6@TJb U=^1l^niuco_<GbTW|b^VAR3=O01*9=L<KCYD<+@5K`Q(' );
define( 'AUTH_SALT',         'rv?;>0kGRKKXio9DQ}3:)`Cuw`nTG~ ,OUm!?@V[@8|vgJ.le}{xpd[8cP,o61^7' );
define( 'SECURE_AUTH_SALT',  ']}Ao!uy.=:m|}u2o;l<kI#Ct:O=9e7G_P$?Ms8n,l5/B@#|TvJcBjZV8fE7,`SY+' );
define( 'LOGGED_IN_SALT',    '}{zhz^?MTj=/g1jTI8iQaaMw>RMgtdq+2C`skh[[dh0Ws7=D&+i[|1+H]-{-`J(e' );
define( 'NONCE_SALT',        'TV#$3MUQNk$^i8_am:XdRf7?;o(laE5=ywyPpm<3q_%*JFG3JCqk9:%b1Qbpn1O4' );
//define( 'WP_CACHE_KEY_SALT', 'ASx-nL#iU]ev&y9;GQN,eo03LK*&(9Z]bTv*wxop2L2&>4e[-kC%g>%:]oBmPK/c' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define ( 'WP_REDIS_HOST' , 'redis' );
define ( 'WP_REDIS_PORT' , '6379' );
define ( 'WP_REDIS_PASSWORD' , '12345' );
define ( 'WP_REDIS_DATABASE', '0' );
define ( 'WP_CACHE_KEY_SALT', 'kyolee.42.fr' );
define ( 'WP_CACHE', true );
define ( 'WP_REDIS_TIMEOUT', '1' );
define ( 'WP_REDIS_READ_TIMEOUT', '1' );

/* That's all, stop editing! Happy publishing. */

/*define ( 'WP_REDIS_CLIENT', 'Predis' );*/

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
