class CreateGlobalElectricityStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :global_electricity_statistics do |t|
      t.string :Features
      t.decimal :_1980
      t.decimal :_1981
      t.decimal :_1982
      t.decimal :_1983
      t.decimal :_1984
      t.decimal :_1985
      t.decimal :_1986
      t.decimal :_1987
      t.decimal :_1988
      t.decimal :_1989
      t.decimal :_1990
      t.decimal :_1991
      t.decimal :_1992
      t.decimal :_1993
      t.decimal :_1994
      t.decimal :_1995
      t.decimal :_1996
      t.decimal :_1997
      t.decimal :_1998
      t.decimal :_1999
      t.decimal :_2000
      t.decimal :_2001
      t.decimal :_2002
      t.decimal :_2003
      t.decimal :_2004
      t.decimal :_2005
      t.decimal :_2006
      t.decimal :_2007
      t.decimal :_2008
      t.decimal :_2009
      t.decimal :_2010
      t.decimal :_2011
      t.decimal :_2012
      t.decimal :_2013
      t.decimal :_2014
      t.decimal :_2015
      t.decimal :_2016
      t.decimal :_2017
      t.decimal :_2018
      t.decimal :_2019
      t.decimal :_2020
      t.decimal :_2021

      t.references :country_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
