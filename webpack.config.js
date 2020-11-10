const path = require('path');

module.exports = {
	entry: './src/index.jsx',
	output: {
		path: path.resolve(__dirname, 'static'),
		filename: 'bundle.js',
	},
	module: {
		rules: [
			{
				test: /\.(js|jsx)$/,
				exclude: /node_modules/,
				loader: 'babel-loader',
				options: {
					presets: ['@babel/preset-env', '@babel/preset-react'],
					plugins: [
						'babel-plugin-macros',
						[
							'@emotion/babel-plugin-jsx-pragmatic',
							{
								export: 'jsx',
								import: '__cssprop',
								module: '@emotion/core',
							},
						],
						['babel-plugin-transform-react-jsx', { pragma: '__cssprop' }],
					],
				},
			},
		],
	},
};
