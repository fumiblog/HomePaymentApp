module ApplicationHelper
  def default_meta_tags
    {
      site: '家計簿アプリ',
      title: 'トップページ',
      reserse: true,
      caraset: 'utf-8',
      description: 'ご訪問ありがとうございます。家計簿をruby on railsで作成しました、',
      keywords: 'rails,ruby,プログラミング,bike,coffee',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('us50c_表.png') }
      ],
      og: {
        site_name: :site, # もしくは site_name: :site
        title: :title, # もしくは title: :title
        description: :description, # もしくは description: :description
        type: 'appsite',
        url: request.original_url,
        image: image_url('us50c_表.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@fumihisa_y',
      }

    }
  end
end
