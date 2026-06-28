import streamlit as st
import pandas as pd

st.title("Apparel Dashboard")

# Load the file
df = pd.read_excel("Dashboard Master.ods", engine="odf")

# Show the data
st.write("Here is your data:")
st.dataframe(df)

# Create a chart
st.line_chart(df)
