const publicPath = {
  production: '/subdir/packs/', // ← 本番のときだけサブディレクトリを指定
  development: '/packs/',
  test: '/packs-test/',
}[process.env.NODE_ENV]

module.exports = {
  test: /\.(jpg|jpeg|png|gif|tiff|ico|svg|eot|otf|ttf|woff|woff2)$/i,
  use: [
    {
      loader: 'file-loader',
      options: {
        publicPath: publicPath,
        outputPath: 'files/',
        name: '[name]-[hash].[ext]',
      },
    },
  ],
}
