import { Sequelize } from 'sequelize';
import mysql2 from 'mysql2';
import DebugLib from 'debug';

const debug = new DebugLib('server:mysql');

console.log('process.env.toString()');
console.log(process.env.DATABASE_HOST);

const dbHost = process.env.DATABASE_HOST || 'eoloplantsDB';
const dbUser = process.env.DATABASE_USER || 'root';
const dbPass = process.env.DATABASE_PASS || 'password';

export default new Sequelize(dbHost, dbUser, dbPass, {
    host: process.env.MYSQL_HOST,
    port: process.env.MYSQL_PORT,
    dialect: 'mysql',
    dialectModule: mysql2,
    logging: false
});

process.on('exit', async () => {
    await sequelize.close();
    debug(`Closing mysql connection`);
});
